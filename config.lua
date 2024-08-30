Config = {}

Config.defaultlang = "de_lang" -- Set Language (Current Languages: "de_lang" German)

--------------- WEBHOOK

Config.WebHook = true

Config.WHTitle = 'QuestSystem:'
Config.WHLink = ''  -- Discord WH link Here
Config.WHColor = 16711680 -- red
Config.WHName = 'QuestSystem:' -- name
Config.WHLogo = '' -- must be 30x30px
Config.WHFooterLogo = '' -- must be 30x30px
Config.WHAvatar = '' -- must be 30x30px
-----------------------------------------------------------------------------------------------------

Config.RandomPosition = false
Config.QuestgeberBlip = true
Config.CreateQuestgeberNPC = true
Config.AbortQuestTimer = 600 -- Time in Secounds if someone aborts a Quest to Restart it Again 600 Secs = 10 Min

Config.Questgeber = {  
    { Coords = vector3(-329.35, -145.99, 50.7), NpcHeading = 59.43 },
    { Coords = vector3(-1836.84, -418.89, 161.71), NpcHeading = 235.12 },
    { Coords = vector3(1394.04, -1135.79, 76.6), NpcHeading = 149.63 },
    { Coords = vector3(-740.09, -1333.12, 43.72), NpcHeading = 71.9 },
    { Coords = vector3(-3673.96, -2605.31, -13.67), NpcHeading = 178.96 },
}


Config.Quests ={
    {
        Type = 'Bring',
        Coords = vector3(-5962.42, -3241.51, -21.58), --Quest Location
        Title = 'Durchsuche die Kiste', -- First you Make the Animation of Crouch and Progressbar then Title2 Bring Items 
        Title2 = 'Da Fehlt etwas!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'salt' , Label = 'Salz', Amount = 5},
            { Item = 'wood' , Label = 'Weichholz', Amount = 5},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
        
    },
    {
        Type = 'Bring',
        Title = 'Sabortiere den Galgen',
        Coords = vector3(-4207.09, -3444.52, 37.14),
        Title2 = 'Ohne Axt wird das Nichts!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'hatchet' , Label = 'Axt', Amount = 1},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
        
    },
    {
        Type = 'Bring',
        Title = 'Hinterlasse eine Notiz',
        Coords = vector3(-2769.09, -3049.43, 11.34),
        Title2 = 'Stift aus Kohle und Holz.', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'coal' , Label = 'Kohle', Amount = 5},
            { Item = 'wood' , Label = 'Weichholz', Amount = 5},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
        
    },
    {
        Type = 'Bring',
        Title = 'Probiere die Suppe',
        Coords = vector3(-2067.15, -1913.68, 113.13),
        Title2 = 'Da fehlen Zutaten.', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'Bay_Bolete' , Label = 'Brauner Steinpilz', Amount = 3},
            { Item = 'Wild_Carrot' , Label = 'Wilde Karotte', Amount = 4},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Title = 'Lese die Nachricht',
        Coords = vector3(-1583.42, -926.75, 84.8),
        Title2 = 'Rennen verbraucht viel Ausdauer!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'ausdauertrank' , Label = 'Ausdauer Trank', Amount = 2},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Prüfe den Wasserstand',
        Coords = vector3(1602.13, 1451.09, 145.7),
        Title2 = 'Dem See fehlt Wasser!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'water' , Label = 'Wasser', Amount = 20},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Hier liegt viel Schnee',
        Coords = vector3(-1649.08, 1222.84, 351.59),
        Title2 = 'Schaufel den Schnee Weg!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'shovel' , Label = 'Schaufel', Amount = 1},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Iss und Trink Etwas',
        Coords = vector3(-1304.63, 397.25, 95.48),
        Title2 = 'Hab ich ein Hunger und Durst!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'Bananenshake' , Label = 'Bananenshake', Amount = 2},
            { Item = 'Jagdwurst' , Label = 'Jagdwurst', Amount = 2},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Wärme dich am Feuer',
        Coords = vector3(-1885.81, 1335.19, 200.81),
        Title2 = 'Lege Holz nach!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'hwood' , Label = 'Hartholz', Amount = 5},
            { Item = 'wood' , Label = 'Weichholz', Amount = 5},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Besuche Onkel Harry',
        Coords = vector3(-1318.42, 2470.82, 309.81),
        Title2 = 'Bring ein Geschenk mit!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'whiskey' , Label = 'Whiskey', Amount = 2},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Nehme ein Bad in den heißen Quellen',
        Coords = vector3(134.41, 1863.8, 201.44),
        Title2 = 'Trockne Dich ab!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'Handtuch' , Label = 'Handtuch', Amount = 1},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Überprüfe die Zugstrecke',
        Coords = vector3(882.21, 759.4, 108.92),
        Title2 = 'Oh Nein! Da fehlen Nägel', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'Nagel' , Label = 'Nägel', Amount = 8},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Fährten Lesen suche den Bär',
        Coords = vector3(1297.14, 1181.39, 149.62),
        Title2 = 'Lege einen Köder aus!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'meat' , Label = 'Fleisch', Amount = 5},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Genieße die Aussicht',
        Coords = vector3(1984.65, 1932.21, 255.68),
        Title2 = 'Mache ein Picknick!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'pulledporkburger' , Label = 'Pulled Pork Burger', Amount = 2},
            { Item = 'water' , Label = 'Wasser', Amount = 2},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Was ist Hier nur Passiert?',
        Coords = vector3(2475.27, 1998.63, 168.43),
        Title2 = 'Räume auf!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'wateringcan_empty' , Label = 'Leerer Eimer', Amount = 1},
            { Item = 'water' , Label = 'Wasser', Amount = 3},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Klopfe an bei den Hillbillys',
        Coords = vector3(2556.82, 765.37, 78.39),
        Title2 = 'Ohje der ist Sauer Gib Ihm was.!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'Brot' , Label = 'Brot', Amount = 1},
            { Item = 'Brotchen' , Label = 'Brötchen', Amount = 1},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Hier gibt es Krokodile',
        Coords = vector3(2221.86, -548.84, 41.74),
        Title2 = 'Bringe Munition für die Jagd!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'ammoriflenormal' , Label = 'Gewehr Munition', Amount = 1},
            { Item = 'ammopistolnormal' , Label = 'Pistolen Munition', Amount = 1},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Helfe bei der Feldarbeit',
        Coords = vector3(1861.01, -1322.95, 42.28),
        Title2 = 'Benutze deine Harke!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'hoe' , Label = 'Gartenharke', Amount = 1},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
    {
        Type = 'Bring',
        Title = 'Putze die Toilette',
        Coords = vector3(-292.42, 824.27, 119.65),
        Title2 = 'Wasser und Seife helfen Dir!', -- Prompt 2 Title 1 is Gones Title 2 Opens the Menü Then
        ItemsToBring = { -- items you need to Bring to Complete Quest
            { Item = 'water' , Label = 'Wasser', Amount = 5},
            { Item = 'Seife' , Label = 'Seife', Amount = 1},
        },
        RewardItem = { Enabled = true, Item = 'QuestToken', Label = 'Quest Token', RewardItemMin = 10, RewardItemMax = 25}, -- set Enabled to false if you dont wanna Give item
        RewardMoney = { Enabled = true, RewardMoneyMin = 20, RewardMoneyMax = 35}, -- set Enabled to false if you dont wanna Give Money
    },
}

--- A Shop to Buy Items witht he Tokens you Got

Config.ShopSystemActive = true -- if you wanna use a shop in Here

Config.ShopSystem = {  -- ONLY ENABLE 1 Money, Item Or Weapon.
    {
        ItemNeeded = 'QuestToken',-- DB Name
        Price = 100,-- Token Neeeded
        RewardItem = {Enabled = false, Title = 'Schildkröte', Item = 'HaustierTicket24' , Amount = 1},
        RewardWeapon = {Enabled = true, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',-- DB Name
        Price = 100,-- Token Neeeded
        RewardItem = {Enabled = false, Title = 'Schildkröte', Item = 'HaustierTicket24' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = true, Title = 'Token für Geld: $ ', MoneyPerToken = 3},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',-- DB Name
        Price = 100,-- Token Neeeded
        RewardItem = {Enabled = true, Title = 'Schildkröte', Item = 'HaustierTicket24' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 250,
        RewardItem = {Enabled = true, Title = 'Bieber', Item = 'HaustierTicket1' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 300,
        RewardItem = {Enabled = true, Title = 'Waschbär', Item = 'HaustierTicket25' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 300,
        RewardItem = {Enabled = true, Title = 'Gürteltier', Item = 'HaustierTicket6' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 350,
        RewardItem = {Enabled = true, Title = 'Krabbe', Item = 'HaustierTicket4' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 350,
        RewardItem = {Enabled = true, Title = 'Stinktier', Item = 'HaustierTicket10' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 400,
        RewardItem = {Enabled = true, Title = 'Fuchs', Item = 'HaustierTicket8' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 400,
        RewardItem = {Enabled = true, Title = 'Schaf', Item = 'HaustierTicket5' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 400,
        RewardItem = {Enabled = true, Title = 'Ziege', Item = 'HaustierTicket9' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 500,
        RewardItem = {Enabled = true, Title = 'Bulle', Item = 'HaustierTicket2' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 500,
        RewardItem = {Enabled = true, Title = 'Kuh', Item = 'HaustierTicket3' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 600,
        RewardItem = {Enabled = true, Title = 'Elch', Item = 'HaustierTicket7' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 700,
        RewardItem = {Enabled = true, Title = 'Muli', Item = 'HaustierTicket26' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 800,
        RewardItem = {Enabled = true, Title = 'Muli Painted', Item = 'HaustierTicket27' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 900,
        RewardItem = {Enabled = true, Title = 'American Standard ( Pferd )', Item = 'HaustierTicket11' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 900,
        RewardItem = {Enabled = true, Title = 'Appaloosa ( Pferd )', Item = 'HaustierTicket12' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 900,
        RewardItem = {Enabled = true, Title = 'Arabian ( Pferd )', Item = 'HaustierTicket13' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 900,
        RewardItem = {Enabled = true, Title = 'Kladruber ( Pferd )', Item = 'HaustierTicket14' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 900,
        RewardItem = {Enabled = true, Title = 'Missouri Foxtrotter ( Pferd )', Item = 'HaustierTicket15' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 900,
        RewardItem = {Enabled = true, Title = 'Shire ( Pferd )', Item = 'HaustierTicket16' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 1500,
        RewardItem = {Enabled = true, Title = 'Alligator', Item = 'HaustierTicket17' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 1500,
        RewardItem = {Enabled = true, Title = 'Bär', Item = 'HaustierTicket19' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 1500,
        RewardItem = {Enabled = true, Title = 'Schwarzbär', Item = 'HaustierTicket20' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 1750,
        RewardItem = {Enabled = true, Title = 'Wolf', Item = 'HaustierTicket23' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 2000,
        RewardItem = {Enabled = true, Title = 'Panther', Item = 'HaustierTicket21' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 2000,
        RewardItem = {Enabled = true, Title = 'Puma', Item = 'HaustierTicket22' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 5000,
        RewardItem = {Enabled = true, Title = 'Legendäres Wildschwein', Item = 'HaustierTicket' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
    {
        ItemNeeded = 'QuestToken',
        Price = 6000,
        RewardItem = {Enabled = true, Title = 'Legendärer Alligator', Item = 'HaustierTicket18' , Amount = 1},
        RewardWeapon = {Enabled = false, Title = 'Messer', Weapon = 'WEAPON_MELEE_KNIFE'},
        RewardMoney = {Enabled = false, Title = 'Token für Geld: ', MoneyPerToken = 1},  --- Money Per Token Means Price * MoneyPerToken = Amount you Get. if you make 2 you get 200$ for 100 Tokens
    },
}