local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("DrRay", "Default")

local tab = DrRayLibrary.newTab("Main", "ImageIdHere")

tab.newButton("gomquai", "all!!!", function()
--[[ 
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

local blackHoleActive = true

local function toggleBlackHole()
    blackHoleActive = not blackHoleActive
    if blackHoleActive then
        for _, v in next, Workspace:GetDescendants() do
            ForcePart(v)
        end

        Workspace.DescendantAdded:Connect(function(v)
            if blackHoleActive then
                ForcePart(v)
            end
        end)

        spawn(function()
            while blackHoleActive and RunService.RenderStepped:Wait() do
                Attachment1.WorldCFrame = humanoidRootPart.CFrame
            end
        end)
    end
end

local function createControlButton()
    local screenGui = Instance.new("ScreenGui")
    local button = Instance.new("TextButton")

    screenGui.Name = "BlackHoleControlGUI"
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    button.Name = "ToggleBlackHoleButton"
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0, 100)
    button.Text = "Desativar Buraco Negro"
    button.Parent = screenGui

    button.MouseButton1Click:Connect(function()
        toggleBlackHole()
        if blackHoleActive then
            button.Text = "Desativar Buraco Negro"
        else
            button.Text = "Ativar Buraco Negro"
        end
    end)
end

createControlButton()
toggleBlackHole()
end)
tab.newButton("killarua", "allmap", function()

local enabled = false
local textButton

local function executeScript()
    getgenv().G = true
    getgenv().Creator = 'https://discord.gg/B3HqPPzFYr - HalloweenGaster'
    
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 112412400000)
    sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 112412400000)
    
    for _, d in pairs(game.Workspace:GetDescendants()) do
        if d.ClassName == 'Humanoid' and not game.Players:GetPlayerFromCharacter(d.Parent) then
            d.Health = 0
        end
    end
end

local function checkForNearbyNPCs()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    for _, npc in pairs(game.Workspace:GetDescendants()) do
        if npc:IsA("Model") and npc:FindFirstChild("Humanoid") and npc ~= character then
            local npcRootPart = npc:FindFirstChild("HumanoidRootPart")
            if npcRootPart then
                local distance = (npcRootPart.Position - rootPart.Position).Magnitude
                if distance <= 25 then
                    executeScript()
                    break
                end
            end
        end
    end
end

local function createToggleButton()
    local ScreenGui = Instance.new("ScreenGui")
    local TextButton = Instance.new("TextButton")
    local UIScale = Instance.new("UIScale")
    local UIStroke = Instance.new("UIStroke")

    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    TextButton.Parent = ScreenGui
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.Position = UDim2.new(0, 10, 0.5, -20)
    TextButton.Size = UDim2.new(0, 100, 0, 40)  -- Smaller size for the button
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = "NPC Check OFF"
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextSize = 18
    TextButton.TextStrokeTransparency = 0  -- Ensure text stroke is visible

    UIScale.Parent = TextButton
    UIScale.Scale = 1  -- Default scale, can be adjusted if needed

    UIStroke.Parent = TextButton
    UIStroke.Thickness = 2  -- Border thickness
    UIStroke.Color = Color3.fromRGB(0, 0, 0)  -- Border color
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border  -- Apply stroke to the border

    textButton = TextButton  -- Save a reference to the button for later

    TextButton.MouseButton1Click:Connect(function()
        enabled = not enabled
        TextButton.Text = enabled and "NPC Check ON" or "NPC Check OFF"
    end)

    -- Make the TextButton draggable
    local dragging = false
    local dragInput, dragStart, startPos

    local function updateDrag(input)
        local delta = input.Position - dragStart
        TextButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    TextButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = TextButton.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    TextButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragging then
                updateDrag(input)
            end
        end
    end)
end

local function startChecking()
    while true do
        if enabled then
            checkForNearbyNPCs()
        end
        wait(0.5)  -- Delay for 0.5 second
    end
end

local function onPlayerCharacterAdded()
    -- Remove the old button if it exists
    if textButton and textButton.Parent then
        textButton.Parent:Destroy()
    end

    -- Create the toggle button again
    createToggleButton()
end

-- Create the toggle button initially
createToggleButton()

-- Start the check loop with a delay
spawn(startChecking)

-- Recreate the toggle button when the player respawns
game.Players.LocalPlayer.CharacterAdded:Connect(onPlayerCharacterAdded)
end)

tab.newButton("stop", "", function()

local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local StatusPF = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")
local Plr = Players.LocalPlayer
local Clipon = false
Cooldown = .0*.0*.0*.0

Noclip.Name = "stop monter Script"
Noclip.Parent = game.CoreGui

BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 210, 0, 127)
BG.Active = true
BG.Draggable = true

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(13, 105, 172)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 210, 0, 33)
Title.Font = Enum.Font.Highway
Title.Text = "stop monster walk and stop jump op"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0

Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.new(123, 182, 232)
Toggle.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.152380958, 0, 0.374192119, 0)
Toggle.Size = UDim2.new(0, 146, 0, 36)
Toggle.Font = Enum.Font.Highway
Toggle.FontSize = Enum.FontSize.Size28
Toggle.Text = "stop toggle"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 25
Toggle.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.TextStrokeTransparency = 0

StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.BackgroundColor3 = Color3.new(1, 1, 1)
StatusPF.BackgroundTransparency = 1
StatusPF.Position = UDim2.new(0.314285725, 0, 0.708661377, 0)
StatusPF.Size = UDim2.new(0, 56, 0, 20)
StatusPF.Font = Enum.Font.Highway
StatusPF.FontSize = Enum.FontSize.Size24
StatusPF.Text = "Status:"
StatusPF.TextColor3 = Color3.new(1, 1, 1)
StatusPF.TextSize = 20
StatusPF.TextStrokeColor3 = Color3.new(0.333333, 0.333333, 0.333333)
StatusPF.TextStrokeTransparency = 0
StatusPF.TextWrapped = true

Status.Name = "Status"
Status.Parent = BG
Status.BackgroundColor3 = Color3.new(1, 1, 1)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.580952346, 0, 0.708661377, 0)
Status.Size = UDim2.new(0, 56, 0, 20)
Status.Font = Enum.Font.Highway
Status.FontSize = Enum.FontSize.Size14
Status.Text = "off"
Status.TextColor3 = Color3.new(0.666667, 0, 0)
Status.TextScaled = true
Status.TextSize = 14
Status.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Status.TextWrapped = true
Status.TextXAlignment = Enum.TextXAlignment.Left

Credit.Name = "Credit"
Credit.Parent = BG
Credit.BackgroundColor3 = Color3.new(1, 1, 1)
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.195238099, 0, 0.866141737, 0)
Credit.Size = UDim2.new(0, 128, 0, 17)
Credit.Font = Enum.Font.SourceSans
Credit.FontSize = Enum.FontSize.Size18
Credit.Text = "by sazx hub"
Credit.TextColor3 = Color3.new(1, 1, 1)
Credit.TextSize = 16
Credit.TextStrokeColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Credit.TextStrokeTransparency = 0
Credit.TextWrapped = true
Toggle.MouseButton1Click:connect(function()
    if Status.Text == "off" then
        Clipon = true
        Status.Text = "on"
        Status.TextColor3 = Color3.new(0, 185, 0)
        
        -- เพิ่มลูป while นี้
local Cooldown = .0*.0*.0 -- ปรับเวลาให้เหมาะสม

while Clipon do
    pcall(function()
        wait(Cooldown)
        local player = game.Players.LocalPlayer
        local playerPos = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position

        if playerPos then
            for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                    local mobPos = v.HumanoidRootPart.Position

                    if mobPos and (playerPos - mobPos).Magnitude <= 50 and v ~= player.Character then
                        v.HumanoidRootPart.Size = Vector3.new(2, 2, 2)
                        v.HumanoidRootPart.Transparency = 0.5
                        v.HumanoidRootPart.CanCollide = false
                        
                        local humanoid = v:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid.WalkSpeed = 0
                            humanoid.JumpPower = 0
                        end

                        if sethiddenproperty then
                            sethiddenproperty(player, "SimulationRadius", math.huge)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end
            end
        end
    end)
end
    else
        Clipon = false
        Status.Text = "off"
        Status.TextColor3 = Color3.new(170, 0, 0)
    end
end)
end)
local tab = DrRayLibrary.newTab("Main 2", "ImageIdHere")

tab.newButton("fly", "", function()

loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Fly-v3-13879"))()
end)

tab.newButton("fling ", "", function()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end



local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")

local LocalPlayer = Players.LocalPlayer

-- Sound Effects
local function playSound(soundId)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- Play initial sound
playSound("")

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SuperRingPartsGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 220, 0, 190)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -95)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Light brown
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Make the GUI round
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "???"
Title.TextColor3 = Color3.fromRGB(0, 255, 150) -- Dark brown
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Lighter brown
Title.Font = Enum.Font.Fondamento -- More elegant font
Title.TextSize = 22
Title.Parent = MainFrame

-- Round the title
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = Title

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0.8, 0, 0, 35)
ToggleButton.Position = UDim2.new(0.1, 0, 0.3, 0)
ToggleButton.Text = " Off"
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255) -- Sienna
ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 150) -- Cornsilk
ToggleButton.Font = Enum.Font.Fondamento
ToggleButton.TextSize = 18
ToggleButton.Parent = MainFrame

-- Round the toggle button
local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 10)
ToggleCorner.Parent = ToggleButton

local DecreaseRadius = Instance.new("TextButton")
DecreaseRadius.Size = UDim2.new(0.2, 0, 0, 35)
DecreaseRadius.Position = UDim2.new(0.1, 0, 0.6, 0)
DecreaseRadius.Text = "<"
DecreaseRadius.BackgroundColor3 = Color3.fromRGB(100, 100, 255) -- Saddle brown
DecreaseRadius.TextColor3 = Color3.fromRGB(0, 255, 150) -- Cornsilk
DecreaseRadius.Font = Enum.Font.Fondamento
DecreaseRadius.TextSize = 18
DecreaseRadius.Parent = MainFrame

-- Round the decrease button
local DecreaseCorner = Instance.new("UICorner")
DecreaseCorner.CornerRadius = UDim.new(0, 10)
DecreaseCorner.Parent = DecreaseRadius

local IncreaseRadius = Instance.new("TextButton")
IncreaseRadius.Size = UDim2.new(0.2, 0, 0, 35)
IncreaseRadius.Position = UDim2.new(0.7, 0, 0.6, 0)
IncreaseRadius.Text = ">"
IncreaseRadius.BackgroundColor3 = Color3.fromRGB(100, 100, 255) -- Saddle brown
IncreaseRadius.TextColor3 = Color3.fromRGB(0, 255, 150) -- Cornsilk
IncreaseRadius.Font = Enum.Font.Fondamento
IncreaseRadius.TextSize = 18
IncreaseRadius.Parent = MainFrame

-- Round the increase button
local IncreaseCorner = Instance.new("UICorner")
IncreaseCorner.CornerRadius = UDim.new(0, 10)
IncreaseCorner.Parent = IncreaseRadius

local RadiusDisplay = Instance.new("TextLabel")
RadiusDisplay.Size = UDim2.new(0.4, 0, 0, 35)
RadiusDisplay.Position = UDim2.new(0.3, 0, 0.6, 0)
RadiusDisplay.Text = ": 50"
RadiusDisplay.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Tan
RadiusDisplay.TextColor3 = Color3.fromRGB(0, 255, 150) -- Dark brown
RadiusDisplay.Font = Enum.Font.Fondamento
RadiusDisplay.TextSize = 18
RadiusDisplay.Parent = MainFrame

-- Round the radius display
local RadiusCorner = Instance.new("UICorner")
RadiusCorner.CornerRadius = UDim.new(0, 10)
RadiusCorner.Parent = RadiusDisplay

local Watermark = Instance.new("TextLabel")
Watermark.Size = UDim2.new(1, 0, 0, 20)
Watermark.Position = UDim2.new(0, 0, 1, -20)
Watermark.Text = "????"
Watermark.TextColor3 = Color3.fromRGB(0, 255, 150) -- Dark brown
Watermark.BackgroundTransparency = 1
Watermark.Font = Enum.Font.Fondamento
Watermark.TextSize = 14
Watermark.Parent = MainFrame

-- Add minimize button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -35, 0, 5)
MinimizeButton.Text = "-"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255) -- Saddle brown
MinimizeButton.TextColor3 = Color3.fromRGB(0, 255, 150) -- Cornsilk
MinimizeButton.Font = Enum.Font.Fondamento
MinimizeButton.TextSize = 18
MinimizeButton.Parent = MainFrame

-- Round the minimize button
local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 15)
MinimizeCorner.Parent = MinimizeButton

-- Minimize functionality
local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 220, 0, 40), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "+"
        ToggleButton.Visible = false
        DecreaseRadius.Visible = false
        IncreaseRadius.Visible = false
        RadiusDisplay.Visible = false
        Watermark.Visible = false
    else
        MainFrame:TweenSize(UDim2.new(0, 220, 0, 190), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "-"
        ToggleButton.Visible = true
        DecreaseRadius.Visible = true
        IncreaseRadius.Visible = true
        RadiusDisplay.Visible = true
        Watermark.Visible = true
    end
    playSound("")
end)

-- Make GUI draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Ring Parts Logic
if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }
    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end
    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end
    EnablePartControl()
end

local radius = 50
local height = 100
local rotationSpeed = 1
local attractionStrength = 1000
local ringPartsEnabled = false

local function RetainPart(Part)
    if Part:IsA("BasePart") and not Part.Anchored and Part:IsDescendantOf(workspace) then
        if Part.Parent == LocalPlayer.Character or Part:IsDescendantOf(LocalPlayer.Character) then
            return false
        end

        Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        Part.CanCollide = false
        return true
    end
    return false
end

local parts = {}
local function addPart(part)
    if RetainPart(part) then
        if not table.find(parts, part) then
            table.insert(parts, part)
        end
    end
end

local function removePart(part)
    local index = table.find(parts, part)
    if index then
        table.remove(parts, index)
    end
end

for _, part in pairs(workspace:GetDescendants()) do
    addPart(part)
end

workspace.DescendantAdded:Connect(addPart)
workspace.DescendantRemoving:Connect(removePart)

RunService.Heartbeat:Connect(function()
    if not ringPartsEnabled then return end
    
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local tornadoCenter = humanoidRootPart.Position
        for _, part in pairs(parts) do
            if part.Parent and not part.Anchored then
                local pos = part.Position
                local distance = (Vector3.new(pos.X, tornadoCenter.Y, pos.Z) - tornadoCenter).Magnitude
                local angle = math.atan2(pos.Z - tornadoCenter.Z, pos.X - tornadoCenter.X)
                local newAngle = angle + math.rad(rotationSpeed)
                local targetPos = Vector3.new(
                    tornadoCenter.X + math.cos(newAngle) * math.min(radius, distance),
                    tornadoCenter.Y + (height * (math.abs(math.sin((pos.Y - tornadoCenter.Y) / height)))),
                    tornadoCenter.Z + math.sin(newAngle) * math.min(radius, distance)
                )
                local directionToTarget = (targetPos - part.Position).unit
                part.Velocity = directionToTarget * attractionStrength
            end
        end
    end
end)

-- Button functionality
ToggleButton.MouseButton1Click:Connect(function()
    ringPartsEnabled = not ringPartsEnabled
    ToggleButton.Text = ringPartsEnabled and "On" or "Off"
    ToggleButton.BackgroundColor3 = ringPartsEnabled and Color3.fromRGB(50, 205, 50) or Color3.fromRGB(160, 82, 45)
    playSound("")
end)

DecreaseRadius.MouseButton1Click:Connect(function()
    radius = math.max(1, radius - 2)
    RadiusDisplay.Text = "Radius: " .. radius
    playSound("")
end)

IncreaseRadius.MouseButton1Click:Connect(function()
    radius = math.min(1000, radius + 2)
    RadiusDisplay.Text = "Radius: " .. radius
    playSound("")
end)

-- Get player thumbnail
local userId = Players:GetUserIdFromNameAsync("Robloxlukasgames")
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

end)

tab.newButton("infinittey ", "", function()

loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
tab.newButton("esp", "", function()

for i,v in pairs(game.Workspace:GetDescendants()) do -- grabs everything from workspace


    if v.ClassName == 'TouchTransmitter' and v.Parent.Name == 'Handle' then -- checks if it has a handle and if its a touchtransmitter


        local BillboardGui = Instance.new('BillboardGui') -- Makes Billboardgui


        local TextLabel = Instance.new('TextLabel') -- makes text label


       


        BillboardGui.Parent = v.Parent -- what the billboardgui goes into


        BillboardGui.AlwaysOnTop = true -- if its on top or not


        BillboardGui.Size = UDim2.new(0, 50, 0, 50) -- size of it


        BillboardGui.StudsOffset = Vector3.new(0,2,0)


       


        TextLabel.Parent = BillboardGui -- putting textlabel into billboardgui


        TextLabel.BackgroundColor3 = Color3.new(1,1,1) -- color


        TextLabel.BackgroundTransparency = 1 -- transparency


        TextLabel.Size = UDim2.new(1, 0, 1, 0) -- size


        TextLabel.Text = v.Parent.Parent.Name -- what the label says


        TextLabel.TextColor3 = Color3.new(1, 0, 0) -- color


        TextLabel.TextScaled = true -- if the text is scaled or not


    end


    end
end)
tab.newButton("bring+stop all", "", function()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local DEFAULT_BRING_DISTANCE = 100
local DEFAULT_STOP_SPEED = 0

-- 🧱 Hàm tạo dòng label + textbox đơn giản
local function createLinedInput(parent, labelText, placeholderText)
	local line = Instance.new("Frame", parent)
	line.Size = UDim2.new(1, -40, 0, 30)
	line.BackgroundTransparency = 1

	local label = Instance.new("TextLabel", line)
	label.Size = UDim2.new(0.5, 0, 1, 0)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.Text = labelText
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.SourceSans
	label.TextSize = 18
	label.TextXAlignment = Enum.TextXAlignment.Left

	local box = Instance.new("TextBox", line)
	box.Size = UDim2.new(0.5, 0, 1, 0)
	box.Position = UDim2.new(0.5, 0, 0, 0)
	box.Text = ""
	box.PlaceholderText = placeholderText
	box.ClearTextOnFocus = true
	box.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	box.TextColor3 = Color3.new(1, 1, 1)
	box.Font = Enum.Font.SourceSans
	box.TextSize = 18
	Instance.new("UICorner", box)

	return box
end

local function createGui()
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")

	if player:FindFirstChild("PlayerGui"):FindFirstChild("BringStopUI") then
		player.PlayerGui.BringStopUI:Destroy()
	end
	if player:FindFirstChild("PlayerGui"):FindFirstChild("Toggle") then
		player.PlayerGui.Toggle:Destroy()
	end

	local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	gui.Name = "BringStopUI"
	gui.ResetOnSpawn = false

	local frame = Instance.new("Frame", gui)
	frame.Position = UDim2.new(0.5, -300, 0.5, -220)
	frame.Size = UDim2.new(0, 600, 0, 460)
	frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	frame.BorderSizePixel = 0

	local layout = Instance.new("UIListLayout", frame)
	layout.FillDirection = Enum.FillDirection.Vertical
	layout.Padding = UDim.new(0, 10)
	layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	local padding = Instance.new("UIPadding", frame)
	padding.PaddingTop = UDim.new(0, 20)
	padding.PaddingLeft = UDim.new(0, 20)
	padding.PaddingRight = UDim.new(0, 20)

	local toggle = Instance.new("TextButton", gui)
	toggle.Name = "Toggle"
	toggle.Position = UDim2.new(0, 10, 0, 10)
	toggle.Size = UDim2.new(0, 100, 0, 40)
	toggle.Text = "Toggle"
	toggle.BackgroundColor3 = Color3.fromRGB(60, 130, 200)
	toggle.TextColor3 = Color3.new(1, 1, 1)
	toggle.Font = Enum.Font.SourceSansBold
	toggle.TextSize = 20
	Instance.new("UICorner", toggle)

	toggle.MouseButton1Click:Connect(function()
		frame.Visible = not frame.Visible
	end)

	-- 🧩 Các ô nhập chuẩn yêu cầu
	local bringBox = createLinedInput(frame, "Khoảng cách Bring:", "ví dụ: 100")
	local stopBox = createLinedInput(frame, "Tốc độ sau Stop:", "ví dụ: 0")
	local playerBox = createLinedInput(frame, "Tên người chơi:", "bỏ trống = bạn")
	local yBox = createLinedInput(frame, "Độ cao hút NPC:", "ví dụ: 9")
	local rangeBox = createLinedInput(frame, "Phạm vi hút NPC:", "ví dụ: 50")

	-- Các nút chức năng
	local bringBtn = Instance.new("TextButton", frame)
	bringBtn.Size = UDim2.new(1, -40, 0, 40)
	bringBtn.Text = "Bring"
	bringBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	bringBtn.TextColor3 = Color3.new(1, 1, 1)
	bringBtn.TextSize = 20

	local stopBtn = Instance.new("TextButton", frame)
	stopBtn.Size = UDim2.new(1, -40, 0, 40)
	stopBtn.Text = "Stop"
	stopBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
	stopBtn.TextColor3 = Color3.new(1, 1, 1)
	stopBtn.TextSize = 20

	local pullBtn = Instance.new("TextButton", frame)
	pullBtn.Size = UDim2.new(1, -40, 0, 40)
	pullBtn.Text = "Kéo NPC lên đầu"
	pullBtn.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
	pullBtn.TextColor3 = Color3.new(0, 0, 0)
	pullBtn.TextSize = 20

	-- 🧲 Tạo điểm hút trên đầu
	_G.Global_Y_Offset = 9
	yBox.FocusLost:Connect(function()
		_G.Global_Y_Offset = tonumber(yBox.Text) or 9
	end)

	local headAnchor = Instance.new("Part")
	headAnchor.Anchored = true
	headAnchor.CanCollide = false
	headAnchor.Transparency = 1
	headAnchor.Size = Vector3.new(1, 1, 1)
	headAnchor.Position = hrp.Position + Vector3.new(0, 9, 0)
	headAnchor.Parent = workspace

	local headAttachment = Instance.new("Attachment", headAnchor)

	RunService.Heartbeat:Connect(function()
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp then
			headAnchor.Position = hrp.Position + Vector3.new(0, _G.Global_Y_Offset or 9, 0)
		end
	end)

	pullBtn.MouseButton1Click:Connect(function()
		local range = tonumber(rangeBox.Text) or 50

		for _, npc in pairs(workspace:GetDescendants()) do
			if npc:IsA("Model") and not Players:GetPlayerFromCharacter(npc) then
				local hum = npc:FindFirstChildOfClass("Humanoid")
				local root = npc:FindFirstChild("HumanoidRootPart")
				if hum and root and hum.Health > 0 then
					local dist = (player.Character.HumanoidRootPart.Position - root.Position).Magnitude
					if dist <= range then
						for _, v in ipairs(root:GetChildren()) do
							if v:IsA("AlignPosition") or v:IsA("Attachment") then
								v:Destroy()
							end
						end
						local a0 = Instance.new("Attachment", root)
						local align = Instance.new("AlignPosition")
						align.Attachment0 = a0
						align.Attachment1 = headAttachment
						align.MaxForce = 999999
						align.Responsiveness = 200
						align.RigidityEnabled = false
						align.Name = "PullToAbove"
						align.Parent = root
					end
				end
			end
		end
	end)

	-- Bring / Stop
	local function isPlayer(model)
		for _, p in ipairs(Players:GetPlayers()) do
			if p.Character == model then return true end
		end
		return false
	end

	local function bringMobs(distance, targetPlayer)
		local targetChar = targetPlayer and targetPlayer.Character
		local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
		if not targetRoot then return end

		for _, mob in pairs(workspace:GetDescendants()) do
			if mob:IsA("Model") and mob:FindFirstChildOfClass("Humanoid") and mob:FindFirstChild("HumanoidRootPart") then
				if not isPlayer(mob) then
					local dist = (mob.HumanoidRootPart.Position - targetRoot.Position).Magnitude
					if dist <= distance then
						local offset = Vector3.new(math.random(-4, 4), 0, math.random(-4, 4))
						local goal = targetRoot.CFrame * CFrame.new(offset)
						local tween = TweenService:Create(mob.HumanoidRootPart, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {CFrame = goal})
						tween:Play()
					end
				end
			end
		end
	end

	local function stopMobs(speed)
		for _, mob in pairs(workspace:GetDescendants()) do
			if mob:IsA("Model") and mob:FindFirstChildOfClass("Humanoid") and mob:FindFirstChild("HumanoidRootPart") then
				if not isPlayer(mob) then
					local hum = mob:FindFirstChildOfClass("Humanoid")
					hum.WalkSpeed = speed
					hum.JumpPower = 0
					if sethiddenproperty then
						pcall(function()
							sethiddenproperty(player, "SimulationRadius", math.huge)
						end)
					end
				end
			end
		end
	end

	bringBtn.MouseButton1Click:Connect(function()
		local distance = tonumber(bringBox.Text) or DEFAULT_BRING_DISTANCE
		local targetName = playerBox.Text
		local targetPlayer = targetName ~= "" and Players:FindFirstChild(targetName) or player
		bringMobs(distance, targetPlayer)
	end)

	stopBtn.MouseButton1Click:Connect(function()
		local speed = tonumber(stopBox.Text) or DEFAULT_STOP_SPEED
		stopMobs(speed)
	end)
end

createGui()
player.CharacterAdded:Connect(function()
	task.wait(1)
	createGui()
end)
end)
