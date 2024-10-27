local VORPcore = exports.vorp_core:GetCore()

local GotAllItem = 0

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/RetryR1v2/mms-quests/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

      
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('Current Version: %s'):format(currentVersion))
            versionCheckPrint('success', ('Latest Version: %s'):format(text))
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end
--------------------------------------------------------------------------------------------------

RegisterServerEvent('mms-quests:client:DeliverItems',function(QuestData)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local ItemAmount = #QuestData.ItemsToBring
    for h,v in ipairs (QuestData.ItemsToBring) do
        local Check = exports.vorp_inventory:getItemCount(src, nil, v.Item ,nil)
        if Check >=  v.Amount then
            GotAllItem = GotAllItem + 1
        end
    end
    if ItemAmount == GotAllItem then
        for h,v in ipairs (QuestData.ItemsToBring) do
            exports.vorp_inventory:subItem(src, v.Item, v.Amount, nil, nil)
        end
        TriggerEvent('mms-quests:server:Reward',src,QuestData)
        GotAllItem = 0
    else
        VORPcore.NotifyTip(src,_U('MissingItems2'),"right",4000)
        GotAllItem = 0
    end
end)

RegisterServerEvent('mms-quests:server:Reward',function(src,QuestData)
    local Character = VORPcore.getUser(src).getUsedCharacter
    local Firstname = Character.firstname
    local Lastname = Character.lastname
    local CharIdent = Character.charIdentifier
    local ItemAmount = math.random(QuestData.RewardItem.RewardItemMin,QuestData.RewardItem.RewardItemMax)
    local MoneyAmount = math.random(QuestData.RewardMoney.RewardMoneyMin,QuestData.RewardMoney.RewardMoneyMax)
    if QuestData.RewardItem.Enabled and QuestData.RewardMoney.Enabled then
        local CanCarry = exports.vorp_inventory:canCarryItem(src, QuestData.RewardItem.Item, ItemAmount)
        if CanCarry then
            exports.vorp_inventory:addItem(src, QuestData.RewardItem.Item, ItemAmount, nil, nil)
        else
            VORPcore.NotifyTip(src,_U('NoInvetorySpace'),"right",4000)
        end
        Character.addCurrency(0,MoneyAmount)
        VORPcore.NotifyTip(src,_U('YouGot') .. ItemAmount .. ' ' .. QuestData.RewardItem.Label .. _U('And') .. MoneyAmount .. ' $',"right",4000)
        if Config.WebHook then
            VORPcore.AddWebhook(Config.WHTitle, Config.WHLink, _U('WHText') .. Firstname .. ' ' .. Lastname .. _U('WHId') .. CharIdent .. _U('WHGot') .. ItemAmount .. ' ' .. QuestData.RewardItem.Label .. _U('And') .. MoneyAmount .. ' $' , Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
        end
        TriggerClientEvent('mms-quests:client:EndQuest',src)
    elseif not QuestData.RewardItem.Enabled and QuestData.RewardMoney.Enabled then
        Character.addCurrency(0,MoneyAmount)
        TriggerClientEvent('mms-quests:client:EndQuest',src)
        VORPcore.NotifyTip(src,_U('YouGot') .. MoneyAmount .. ' $',"right",4000)
        if Config.WebHook then
            VORPcore.AddWebhook(Config.WHTitle, Config.WHLink, _U('WHText') .. Firstname .. ' ' .. Lastname .. _U('WHId') .. CharIdent .. _U('WHGot') .. MoneyAmount .. ' $', Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
        end
    elseif QuestData.RewardItem.Enabled and not QuestData.RewardMoney.Enabled then
        local CanCarry = exports.vorp_inventory:canCarryItem(src, QuestData.RewardItem.Item, ItemAmount)
        if CanCarry then
            exports.vorp_inventory:addItem(src, QuestData.RewardItem.Item, ItemAmount, nil, nil)
        else
            VORPcore.NotifyTip(src,_U('NoInvetorySpace'),"right",4000)
        end
        VORPcore.NotifyTip(src,_U('YouGot') .. ItemAmount .. ' ' .. QuestData.RewardItem.Label ,"right",4000)
        if Config.WebHook then
            VORPcore.AddWebhook(Config.WHTitle, Config.WHLink, _U('WHText') .. Firstname .. ' ' .. Lastname .. _U('WHId') .. CharIdent .. _U('WHGot') .. ItemAmount .. ' ' .. QuestData.RewardItem.Label , Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
        end
        TriggerClientEvent('mms-quests:client:EndQuest',src)
        local EXPGain = Config.GetExp
        BattlepassReward (src,EXPGain)
    end
end)

RegisterServerEvent('mms-quests:server:BuyTicket',function(RT)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    if RT.RewardItem.Enabled then
        local HasItem = exports.vorp_inventory:getItemCount(src, nil, RT.ItemNeeded,nil)
        if HasItem >= RT.Price then
            local CanCarry = exports.vorp_inventory:canCarryItem(src, RT.RewardItem.Item, RT.RewardItem.Amount)
            if CanCarry then
                exports.vorp_inventory:addItem(src, RT.RewardItem.Item, RT.RewardItem.Amount, nil, nil)
                exports.vorp_inventory:subItem(src, RT.ItemNeeded, RT.Price, nil, nil)
                VORPcore.NotifyTip(src,_U('SuccessfullyBoughtItem'),"right",4000)
            else
                VORPcore.NotifyTip(src,_U('NoInvetorySpace'),"right",4000)
            end
        else
            VORPcore.NotifyTip(src,_U('NotEnoghToken'),"right",4000)
        end
    elseif RT.RewardWeapon.Enabled then
        local HasItem = exports.vorp_inventory:getItemCount(src, nil, RT.ItemNeeded,nil)
        if HasItem >= RT.Price then
            local CanCarry = exports.vorp_inventory:canCarryWeapons(src, 1, nil, RT.RewardWeapon.Weapon)
            if CanCarry then
                exports.vorp_inventory:subItem(src, RT.ItemNeeded, RT.Price, nil, nil)
                exports.vorp_inventory:createWeapon(src, RT.RewardWeapon.Weapon)
                VORPcore.NotifyTip(src,_U('SuccessfullyBoughtItem'),"right",4000)
            else
                VORPcore.NotifyTip(src,_U('NoInvetorySpace'),"right",4000)
            end
        else
            VORPcore.NotifyTip(src,_U('NotEnoghToken'),"right",4000)
        end
    elseif RT.RewardMoney.Enabled then
        local HasItem = exports.vorp_inventory:getItemCount(src, nil, RT.ItemNeeded,nil)
        if HasItem >= RT.Price then
            local CanCarry = exports.vorp_inventory:canCarryWeapons(src, 1, nil, RT.RewardWeapon.Weapon)
            if CanCarry then
                exports.vorp_inventory:subItem(src, RT.ItemNeeded, RT.Price, nil, nil)
                Character.addCurrency(0,RT.Price * RT.RewardMoney.MoneyPerToken)
                VORPcore.NotifyTip(src,_U('SuccessfullyBoughtItem'),"right",4000)
            else
                VORPcore.NotifyTip(src,_U('NoInvetorySpace'),"right",4000)
            end
        else
            VORPcore.NotifyTip(src,_U('NotEnoghToken'),"right",4000)
        end
    end
end)

-------------------------------- Battlepass Reward ------------------------------------

function BattlepassReward (src,EXPGain)
    if Config.BattlepassActive then
        TriggerEvent('mms-battlepass:server:GainExp',src,EXPGain)
    end
end

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()