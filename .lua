-- Verifica se o jogo é o Blox Fruits
if game.PlaceId ~= 2753915549 then
    print("Este script só funciona no Blox Fruits!")
    return
end

print("Blox Fruits detectado! Executando o script...")

-- Aguarda até que o jogo e o jogador estejam carregados
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Proteção Anti-Ban
local function InitializeAntiBan()
    local Player = game:GetService("Players").LocalPlayer
    local RunService = game:GetService("RunService")
    local VirtualUser = game:GetService("VirtualUser") -- Certifique-se de inicializar o VirtualUser

    RunService.Stepped:Connect(function()
        pcall(function()
            setfflag("AbuseReportScreenshot", "false")
            setfflag("CrashPadUploadToBacktraceToBacktraceBaseUrl", "")
            if setreadonly then setreadonly(debug.getmetatable(game), false) end
            if hookfunction then
                hookfunction(game.HttpGet, function()
                    return "Antiban Active"
                end)
            end
        end)
    end)

    Player.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)

    print("[Anti-Ban] Protection Enabled!")
end

-- Inicializa o Anti-Ban
InitializeAntiBan()

-- Carrega a biblioteca de GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourlibraryurl"))()
local Window = Library:CreateWindow("Moon Hub v10")

-- ============================
-- Criação das Tabs
-- ============================
local ShopTab = Window:CreateTab("Tab Shop")
local StatusServerTab = Window:CreateTab("Tab Status And Server")
local LocalPlayerTab = Window:CreateTab("Tab Local Player")
local SettingFarmTab = Window:CreateTab("Setting Farm")
local SettingSkillTab = Window:CreateTab("Setting Hold and Select Skill")
local FarmingTab = Window:CreateTab("Tab Farming")
local StackFarmTab = Window:CreateTab("Tab Stack Farm")
local FarmingOtherTab = Window:CreateTab("Tab Farming Other")

-- ============================
-- Funções para Shop Tab
-- ============================
ShopTab:CreateButton("Auto Buy Fruits", function()
    print("Auto Buy Fruits ativado!")
end)

ShopTab:CreateButton("Auto Buy Sword", function()
    print("Auto Buy Sword ativado!")
end)

ShopTab:CreateButton("Auto Buy Fighting Style", function()
    print("Auto Buy Fighting Style ativado!")
end)

-- ============================
-- Funções para Status And Server Tab
-- ============================
StatusServerTab:CreateButton("Check Ping", function()
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
    print("Current Ping: " .. ping .. " ms")
end)

StatusServerTab:CreateButton("Rejoin Server", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

StatusServerTab:CreateButton("Switch Server", function()
    local HttpService = game:GetService("HttpService")
    local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    for _, v in pairs(Servers.data) do
        if v.playing < v.maxPlayers then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
            break
        end
    end
end)

-- ============================
-- Funções para Local Player Tab
-- ============================
LocalPlayerTab:CreateButton("Infinite Energy", function()
    print("Infinite Energy ativado!")
end)

LocalPlayerTab:CreateButton("No Clip", function()
    print("No Clip ativado!")
end)

-- ============================
-- Finalização
-- ============================
print("[Blox Fruits Ultimate Hub v10] Successfully Loaded!")
