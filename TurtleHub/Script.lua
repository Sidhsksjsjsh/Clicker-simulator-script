-- Tables For Pets & Shit
local EggTable = {}
local ZoneTable = {}
for _,Egg in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    table.insert(EggTable, Egg.Name)
end
for _,Zone in pairs(game:GetService("Workspace").Zones:GetChildren()) do
    table.insert(ZoneTable, Zone.Name)
end

-- Anti AFK
game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
-- All Of The God Damn Easy Ass Shit (Ui Lib Set Ups)
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/aC8GQEKE"))()
local ui = Library:CreateWindow()


local Main = ui:new("Auto farm")
local Pets = ui:new("Pets")
local Misc = ui:new("Misc")
-- Section()

-- Ui Lib Toggles, Dropdowns,Etc For Script
Main:CreateToggle("Auto Click", false, function(Vals)
    AutoClick = Vals
end)

Main:CreateToggle("Auto Collect Gifts", false, function(Vals)
    CollectGift = Vals
end)

Pets:CreateDropdown("Select Egg", EggTable, function(Value)
    SelectedEgg = Value
end)

Pets:CreateToggle("Open Egg", false, function(Vals)
    OpenEgg = Vals
end)

Pets:CreateBox("Combine Pet Name", "Pet Name Here", function(Values)
    CombinePetName = Values
end)

Pets:CreateToggle("Auto Shiny Pet", false, function(Vals)
    AutoShiny = Vals
end)

Misc:CreateDropdown("Teleport Zone", ZoneTable, function(Values)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Zones[Values].teleport.CFrame
end)

Misc:CreateButton("Teleport Main Zone", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lobby.teleport.CFrame
end)

Misc:CreateButton("Teleport Tech Zone", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").techWorld.Portal.teleportPosition.CFrame
end)

-- Script Functioning Parts/Toggles
spawn(function()
    while true do wait()
        if AutoClick then
            getsenv(game:GetService("Players").LocalPlayer.PlayerGui.mainUI.LocalScript).activateClick()
        end
    end
end)
spawn(function()
    while true do wait()
        if OpenEgg then
            local ohInstance1 = workspace.Eggs[SelectedEgg]
            local ohBoolean2 = false
            local ohBoolean3 = false
            game:GetService("ReplicatedStorage").Events.Client.purchaseEgg2:InvokeServer(ohInstance1, ohBoolean2, ohBoolean3)
        end
    end
end)


spawn(function()
    while true do wait(0.3)
        if AutoShiny then
            local ohString1 = CombinePetName
            local ohNumber2 = 1
            game:GetService("ReplicatedStorage").Events.Client.upgradePet:FireServer(ohString1, ohNumber2, ohInstance3)
        end
    end
end)
spawn(function()
    while true do wait(0.1)
        if CollectGift then
            game:GetService("ReplicatedStorage").Events.Client.collectGifts:FireServer()
        end
    end
end)
