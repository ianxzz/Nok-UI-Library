local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Cria ScreenGui para as notificações
local NotificationGui = Instance.new("ScreenGui", PlayerGui)
NotificationGui.Name = "NotificationGui"
NotificationGui.ResetOnSpawn = false
NotificationGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function createNotification(text, duration)
    duration = duration or 2
    
    -- Frame da notificação
    local notifFrame = Instance.new("Frame")
    notifFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notifFrame.BorderSizePixel = 0
    notifFrame.Size = UDim2.new(0, 200, 0, 40)
    notifFrame.AnchorPoint = Vector2.new(0.5, 1)
    notifFrame.Position = UDim2.new(0.5, 0, 1, -60) -- Posição base (ajuste depois)
    notifFrame.BackgroundTransparency = 0.1
    notifFrame.Parent = NotificationGui
    notifFrame.ClipsDescendants = true
    Instance.new("UICorner", notifFrame).CornerRadius = UDim.new(0, 6)
    
    -- Texto da notificação
    local notifText = Instance.new("TextLabel", notifFrame)
    notifText.Size = UDim2.new(1, -20, 1, 0)
    notifText.Position = UDim2.new(0, 10, 0, 0)
    notifText.BackgroundTransparency = 1
    notifText.TextColor3 = Color3.new(1,1,1)
    notifText.TextStrokeColor3 = Color3.new(0,0,0)
    notifText.TextStrokeTransparency = 0.75
    notifText.Font = Enum.Font.SourceSansBold
    notifText.TextSize = 20
    notifText.TextXAlignment = Enum.TextXAlignment.Center
    notifText.Text = text
    
    -- Tween para aparecer
    notifFrame.Position = UDim2.new(0.5, 0, 1, 40)
    TweenService:Create(notifFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 1, -60)}):Play()
    
    -- Remove a notificação depois da duração
    delay(duration, function()
        TweenService:Create(notifFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, 0, 1, 40)}):Play()
        wait(0.3)
        notifFrame:Destroy()
    end)
end

return {
    Notify = createNotification
}