local VORPcore = exports.vorp_core:GetCore()
local progressbar = exports.vorp_progressbar:initiate()
local BccUtils = exports['bcc-utils'].initiate()
local FeatherMenu =  exports['feather-menu'].initiate()

---- Globals
local QuestActive = false
local CreatedQuestBlips = {}
local CreatedQuestNpcs = {}
local RandomLocation = math.random(1,#Config.Questgeber)
local Selected = Config.Questgeber[RandomLocation]
local GPSCoords = nil
local AbortedQuest = false
local AbortQuestTimer = 0
local QuestOpened = false


---------------------------------------------------------------------------------

Citizen.CreateThread(function()
    local StartQuestPrompt = BccUtils.Prompts:SetupPromptGroup()
    local startquestprompt = StartQuestPrompt:RegisterPrompt(_U('PromptName'), 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = 'MEDIUM_TIMED_EVENT'})
    if Config.RandomPosition then

        if Config.QuestgeberBlip then
            local questblip = BccUtils.Blips:SetBlip(_U('BlipNameQuestgeber'), 'blip_mp_location_q', 3.0, Selected.Coords.x,Selected.Coords.y,Selected.Coords.z)
            CreatedQuestBlips[#CreatedQuestBlips + 1] = questblip
        end
        if Config.CreateQuestgeberNPC then
            local questped = BccUtils.Ped:Create('A_M_O_SDUpperClass_01', Selected.Coords.x,Selected.Coords.y,Selected.Coords.z -1, 0, 'world', false)
            CreatedQuestNpcs[#CreatedQuestNpcs + 1] = questped
            questped:Freeze()
            questped:SetHeading(Selected.NpcHeading)
            questped:Invincible()
            SetBlockingOfNonTemporaryEvents(questped:GetPed(), true)
        end
        while true do
            Wait(1)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local dist1 = #(playerCoords - Selected.Coords)
            if dist1 < 2 then
                StartQuestPrompt:ShowGroup(_U('PromptName'))

                if startquestprompt:HasCompleted() then
                    TriggerEvent('mms-quests:client:openquestboard')
                end
            end
        end
    elseif not Config.RandomPosition then
        if Config.QuestgeberBlip then
            for h,v in ipairs(Config.Questgeber) do
            local questblip = BccUtils.Blips:SetBlip(_U('BlipNameQuestgeber'), 'blip_mp_location_q', 3.0, v.Coords.x,v.Coords.y,v.Coords.z)
            CreatedQuestBlips[#CreatedQuestBlips + 1] = questblip
            end
        end
        if Config.CreateQuestgeberNPC then
            for h,v in ipairs(Config.Questgeber) do
            local questped = BccUtils.Ped:Create('A_M_O_SDUpperClass_01', v.Coords.x,v.Coords.y,v.Coords.z -1, 0, 'world', false)
            CreatedQuestNpcs[#CreatedQuestNpcs + 1] = questped
            questped:Freeze()
            questped:SetHeading(v.NpcHeading)
            questped:Invincible()
            SetBlockingOfNonTemporaryEvents(questped:GetPed(), true)
        end
        end
        while true do
            Wait(1)
            for h,v in ipairs(Config.Questgeber) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local dist1 = #(playerCoords - v.Coords)
            if dist1 < 2 then
                StartQuestPrompt:ShowGroup(_U('PromptName'))

                if startquestprompt:HasCompleted() then
                    TriggerEvent('mms-quests:client:openquestboard')
                end
            end
            end
        end
    end
end)

RegisterNetEvent('mms-quests:client:openquestboard')
AddEventHandler('mms-quests:client:openquestboard',function()
    QuestMenu:Open({
        startupPage = QuestMenuPage1,
    })
end)

-----------------------------------------------------------------------------------
----------------------------------- MENÜ PART -------------------------------------
-----------------------------------------------------------------------------------

Citizen.CreateThread(function ()
    QuestMenu = FeatherMenu:RegisterMenu('Questmenu', {
        top = '20%',
        left = '20%',
        ['720width'] = '500px',
        ['1080width'] = '700px',
        ['2kwidth'] = '700px',
        ['4kwidth'] = '800px',
        style = {
            ['border'] = '5px solid orange',
            -- ['background-image'] = 'none',
            ['background-color'] = '#FF8C00'
        },
        contentslot = {
            style = {
                ['height'] = '550px',
                ['min-height'] = '250px'
            }
        },
        draggable = true,
    --canclose = false
}, {
    opened = function()
        --print("MENU OPENED!")
    end,
    closed = function()
        --print("MENU CLOSED!")
    end,
    topage = function(data)
        --print("PAGE CHANGED ", data.pageid)
    end
})
    QuestMenuPage1 = QuestMenu:RegisterPage('seite1')
    QuestMenuPage1:RegisterElement('header', {
        value = _U('QuestMenuHeader'),
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    QuestMenuPage1:RegisterElement('line', {
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    QuestMenuPage1:RegisterElement('button', {
        label = _U('QuestStart'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
        if not QuestActive and not AbortedQuest then
            TriggerEvent('mms-quests:client:StartQuest')
            VORPcore.NotifyTip(_U('QuestStarted'),"right",4000)
        elseif QuestActive then
            VORPcore.NotifyTip(_U('AlreadyActiveQuest'),"right",4000)
        elseif AbortedQuest then
            VORPcore.NotifyTip(_U('YouAbortedAlready') .. AbortQuestTimer,"right",4000)
        end
    end)
    if Config.TokenShopActive then
    QuestMenuPage1:RegisterElement('button', {
        label = _U('QuestShop'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
        QuestMenuPage2:RouteTo()
    end)
    end
    QuestMenuPage1:RegisterElement('button', {
        label = _U('QuestAbort'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
        TriggerEvent('mms-quests:client:AbortQuest')
    end)
    QuestMenuPage1:RegisterElement('button', {
        label =  _U('CloseQuestMenu'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        QuestMenu:Close({ 
        })
    end)
    QuestMenuPage1:RegisterElement('subheader', {
        value = _U('QuestMenuHeader'),
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    QuestMenuPage1:RegisterElement('line', {
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    -----------------------------------------------------------------------------------
    ------------------------------------ Seite 2 --------------------------------------
    -----------------------------------------------------------------------------------
    if Config.TokenShopActive then
    QuestMenuPage2 = QuestMenu:RegisterPage('seite2')
    QuestMenuPage2:RegisterElement('header', {
        value = _U('TokenShopHeader'),
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    QuestMenuPage2:RegisterElement('line', {
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    Description = QuestMenuPage2:RegisterElement('textdisplay', {
        value = _U('Description'),
        style = {
                ['color'] = 'orange',
                ['border-radius'] = '6px'
            },
    })
    for i,v in ipairs(Config.TokenShop) do
        QuestMenuPage2:RegisterElement('button', {
            label = v.RewardCount .. ' ' .. v.Title .. _U('For') .. v.Price .. _U('BuyForXToken'),
            style = {
                ['background-color'] = '#FF8C00',
                ['color'] = 'orange',
                ['border-radius'] = '6px'
            },
        }, function()
            local ItemNeed = v.ItemNeeded
            local Price = v.Price
            local Item = v.RewardItem
            local Count = v.RewardCount
            TriggerEvent('mms-quests:client:BuyTicket',ItemNeed,Price,Item,Count)
        end)
    end
    QuestMenuPage2:RegisterElement('button', {
        label = _U('Back'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
        QuestMenuPage1:RouteTo()
    end)
    QuestMenuPage2:RegisterElement('button', {
        label =  _U('CloseTokenShop'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        QuestMenu:Close({ 
        })
    end)
    QuestMenuPage2:RegisterElement('subheader', {
        value = _U('TokenShopHeader'),
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    QuestMenuPage2:RegisterElement('line', {
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
end
end)



-----------------------------------------------------------------------------------
----------------------------------- End Menü --------------------------------------
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
---------------------------------- Start Quest ------------------------------------
-----------------------------------------------------------------------------------

RegisterNetEvent('mms-quests:client:StartQuest')
AddEventHandler('mms-quests:client:StartQuest',function()
    QuestActive = true
    local RandomQuest = math.random(1,#Config.Quests)
    local QuestData = Config.Quests[RandomQuest]
    GPSCoords = QuestData.Coords
    -- Create Blip
    ActiveQuestBlip = BccUtils.Blips:SetBlip(QuestData.Title, 'blip_mp_spawnpoint', 3.0, QuestData.Coords.x,QuestData.Coords.y,QuestData.Coords.z)
    -- Create GPS
    StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
    AddPointToGpsMultiRoute(GPSCoords)
    SetGpsMultiRouteRender(true)

    local QuestDataPrompt = BccUtils.Prompts:SetupPromptGroup()
    local TitlePrompt = QuestDataPrompt:RegisterPrompt(QuestData.Title, 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = 'MEDIUM_TIMED_EVENT'})
    while true do
        Wait(1)
        
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist2 = #(playerCoords - QuestData.Coords)
        if dist2 < 3 then
            QuestDataPrompt:ShowGroup(_U('ActiveQuest') .. QuestData.Title)

            if TitlePrompt:HasCompleted() then
                CrouchAnim()
                progressbar.start(QuestData.Title, 7000, function ()
                end, 'linear')
                Wait(7000)
                ClearPedTasks(PlayerPedId())
                TriggerEvent('mms-quests:client:WaitForItems',QuestData)
                break
            end
        end
    end
end)

RegisterNetEvent('mms-quests:client:WaitForItems')
AddEventHandler('mms-quests:client:WaitForItems',function(QuestData)
    local QuestPromptWait = BccUtils.Prompts:SetupPromptGroup()
    local TitlePrompt2 = QuestPromptWait:RegisterPrompt(QuestData.Title2, 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = 'MEDIUM_TIMED_EVENT'})
    while QuestActive do
        Wait(1)
        
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist3 = #(playerCoords - QuestData.Coords)
        if dist3 < 3 then
            QuestPromptWait:ShowGroup(_U('ActiveQuest') .. QuestData.Title)

            if TitlePrompt2:HasCompleted() then
                TriggerEvent('mms-quests:client:GiveItemMenu',QuestData)
            end
        end
    end
end)

RegisterNetEvent('mms-quests:client:GiveItemMenu')
AddEventHandler('mms-quests:client:GiveItemMenu',function (QuestData)
    if not QuestOpened then 
    QuestMenuPage3 = QuestMenu:RegisterPage('seite3')
    QuestMenuPage3:RegisterElement('header', {
        value = QuestData.Title2,
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    QuestMenuPage3:RegisterElement('line', {
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    Description = QuestMenuPage3:RegisterElement('textdisplay', {
        value = _U('MissingItems'),
        style = {
                ['color'] = 'orange',
                ['border-radius'] = '6px'
            },
    })
    for i,v in ipairs(QuestData.ItemsToBring) do
        QuestMenuPage3:RegisterElement('button', {
            label = _U('BringPlease') .. v.Amount .. ' ' .. v.Label,
            style = {
                ['background-color'] = '#FF8C00',
                ['color'] = 'orange',
                ['border-radius'] = '6px'
            },
        }, function()
            -- No Function needed
        end)
    end
    QuestMenuPage3:RegisterElement('button', {
        label =  _U('DeliverItems'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        TriggerEvent('mms-quests:client:DeliverItems',QuestData)
    end)
    QuestMenuPage3:RegisterElement('button', {
        label =  _U('CloseActiveQuestMenu'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        QuestMenu:Close({ 
        })
    end)
    QuestMenuPage3:RegisterElement('subheader', {
        value = _U('ActiveQuestHeader'),
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    QuestMenuPage3:RegisterElement('line', {
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    QuestMenu:Open({
        startupPage = QuestMenuPage3,
    })
    QuestOpened = true
    elseif QuestOpened then
    QuestMenuPage3:UnRegister()
    QuestMenuPage3 = QuestMenu:RegisterPage('seite3')
    QuestMenuPage3:RegisterElement('header', {
        value = QuestData.Title2,
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    QuestMenuPage3:RegisterElement('line', {
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    Description = QuestMenuPage3:RegisterElement('textdisplay', {
        value = _U('MissingItems'),
        style = {
                ['color'] = 'orange',
                ['border-radius'] = '6px'
            },
    })
    for i,v in ipairs(QuestData.ItemsToBring) do
        QuestMenuPage3:RegisterElement('button', {
            label = _U('BringPlease') .. v.Amount .. ' ' .. v.Label,
            style = {
                ['background-color'] = '#FF8C00',
                ['color'] = 'orange',
                ['border-radius'] = '6px'
            },
        }, function()
            
        end)
    end
    QuestMenuPage3:RegisterElement('button', {
        label =  _U('DeliverItems'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        TriggerEvent('mms-quests:client:DeliverItems',QuestData)
    end)
    QuestMenuPage3:RegisterElement('button', {
        label =  _U('CloseActiveQuestMenu'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        QuestMenu:Close({ 
        })
    end)
    QuestMenuPage3:RegisterElement('subheader', {
        value = _U('ActiveQuestHeader'),
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    QuestMenuPage3:RegisterElement('line', {
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    QuestMenu:Open({
        startupPage = QuestMenuPage3,
    })
    end
end)

---- Delive Items

RegisterNetEvent('mms-quests:client:DeliverItems')
AddEventHandler('mms-quests:client:DeliverItems',function(QuestData)
    TriggerServerEvent('mms-quests:client:DeliverItems',QuestData)
end)

----------------------------- Buy Ticket -------------------------

RegisterNetEvent('mms-quests:client:BuyTicket')
AddEventHandler('mms-quests:client:BuyTicket',function(ItemNeed,Price,Item,Count)
    TriggerServerEvent('mms-quests:server:BuyTicket',ItemNeed,Price,Item,Count)
end)


----------------- Utilities -----------------

------ Animation

function CrouchAnim()
    local dict = "script_rc@cldn@ig@rsc2_ig1_questionshopkeeper"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    TaskPlayAnim(ped, dict, "inspectfloor_player", 0.5, 8.0, -1, 1, 0, false, false, false)
end

RegisterNetEvent('mms-quests:client:EndQuest')
AddEventHandler('mms-quests:client:EndQuest',function()
    if QuestActive then
        ActiveQuestBlip:Remove()
        ClearGpsMultiRoute(GPSCoords)
        QuestActive = false
        QuestMenu:Close({ 
        })
    end
end)

RegisterNetEvent('mms-quests:client:AbortQuest')
AddEventHandler('mms-quests:client:AbortQuest',function()
    if QuestActive then
        VORPcore.NotifyTip(_U('QuestAborted'),"right",4000)
        ActiveQuestBlip:Remove()
        ClearGpsMultiRoute(GPSCoords)
        QuestActive = false
        AbortedQuest = true
        TriggerEvent('mms-quests:client:AbortTimer')
    else
        VORPcore.NotifyTip(_U('NoActiveQuest'),"right",4000)
    end
end)

RegisterNetEvent('mms-quests:client:AbortTimer')
AddEventHandler('mms-quests:client:AbortTimer',function ()
    while AbortedQuest do
        Citizen.Wait(1000)
        AbortQuestTimer = AbortQuestTimer + 1
        if AbortQuestTimer >= Config.AbortQuestTimer then
            AbortedQuest = false
            AbortQuestTimer = 0
            Wait(1000)
            VORPcore.NotifyTip(_U('CanDoQuestAgain'),"right",4000)
        end
    end
end)

------------------------- Clean Up on Resource Restart -----------------------------

RegisterNetEvent('onResourceStop',function(resource)
    if resource == GetCurrentResourceName() then
        for _, npcs in ipairs(CreatedQuestNpcs) do
            npcs:Remove()
	    end
        for _, blips in ipairs(CreatedQuestBlips) do
            blips:Remove()
	    end
        if QuestActive then
            ActiveQuestBlip:Remove()
        end
    end
end)