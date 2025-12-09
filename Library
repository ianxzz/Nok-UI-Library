

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Library = {}
Library.__index = Library

-- Construtor da Library
function Library.new()
    local self = setmetatable({}, Library)

    -- ScreenGui principal
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NokUILibrary"
    ScreenGui.Parent = PlayerGui
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true

    self.ScreenGui = ScreenGui

    -- Container para notificações
    local NotifFolder = Instance.new("Frame", ScreenGui)
    NotifFolder.Name = "NotificationsFolder"
    NotifFolder.AnchorPoint = Vector2.new(1, 1)
    NotifFolder.Position = UDim2.new(1, -50, 1, -80)
    NotifFolder.Size = UDim2.new(0, 250, 0, 0)
    NotifFolder.BackgroundTransparency = 1

    local UIListLayout = Instance.new("UIListLayout", NotifFolder)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    UIListLayout.Padding = UDim.new(0, 5)

    self.NotifFolder = NotifFolder
    self.UIListLayout = UIListLayout

    return self
end

-- Função para criar janela
function Library:Window(config)
    local Window = {}
    setmetatable(Window, { __index = self })

    local frame = Instance.new("Frame", self.ScreenGui)
    frame.Name = config.Text or "Window"
    frame.Size = UDim2.new(0, 300, 0, 400)
    frame.Position = UDim2.new(0.5, -150, 0.5, -200)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

    local title = Instance.new("TextLabel", frame)
    title.Text = config.Text or "Window"
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 20
    title.TextColor3 = Color3.new(1, 1, 1)
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 0, 40)

    local content = Instance.new("Frame", frame)
    content.Name = "Content"
    content.Size = UDim2.new(1, -20, 1, -50)
    content.Position = UDim2.new(0, 10, 0, 45)
    content.BackgroundTransparency = 1

    local UIListLayout = Instance.new("UIListLayout", content)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 10)

    Window.Frame = frame
    Window.Content = content
    Window.UIListLayout = UIListLayout

    -- Botão
    function Window:Button(info)
        local btn = Instance.new("TextButton", self.Content)
        btn.Size = UDim2.new(1, 0, 0, 35)
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        btn.AutoButtonColor = true
        btn.Text = info.Text or "Button"
        btn.Font = Enum.Font.SourceSansBold
        btn.TextSize = 16
        btn.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end)
        btn.MouseButton1Click:Connect(function()
            if info.Callback then
                pcall(info.Callback)
            end
            Library:Notification({
                Text = (info.Text or "Button") .. " clicked!",
                Duration = 2
            })
        end)
    end

    -- Toggle
    function Window:Toggle(info)
        local container = Instance.new("Frame", self.Content)
        container.Size = UDim2.new(1, 0, 0, 35)
        container.BackgroundTransparency = 1

        local label = Instance.new("TextLabel", container)
        label.Text = info.Text or "Toggle"
        label.Font = Enum.Font.SourceSans
        label.TextSize = 16
        label.TextColor3 = Color3.new(1, 1, 1)
        label.BackgroundTransparency = 1
        label.Position = UDim2.new(0, 10, 0, 0)
        label.Size = UDim2.new(1, -50, 1, 0)
        label.TextXAlignment = Enum.TextXAlignment.Left

        local toggleBtn = Instance.new("TextButton", container)
        toggleBtn.Size = UDim2.new(0, 30, 0, 20)
        toggleBtn.Position = UDim2.new(1, -40, 0.5, -10)
        toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        toggleBtn.AutoButtonColor = false
        Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)
        toggleBtn.Text = ""

        local toggled = false

        local function updateToggle()
            if toggled then
                toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            else
                toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            end
        end

        toggleBtn.MouseButton1Click:Connect(function()
            toggled = not toggled
            updateToggle()
            if info.Callback then
                pcall(info.Callback, toggled)
            end
            Library:Notification({
                Text = (info.Text or "Toggle") .. (toggled and " enabled" or " disabled"),
                Duration = 2
            })
        end)

        updateToggle()
    end

    -- Label
    function Window:Label(info)
        local label = Instance.new("TextLabel", self.Content)
        label.Size = UDim2.new(1, 0, 0, 25)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.SourceSans
        label.TextSize = 16
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Text = info.Text or ""
        label.TextXAlignment = Enum.TextXAlignment.Left
    end

    return Window
end

-- Função para criar notificações
function Library:Notification(info)
    local notif = Instance.new("Frame", self.NotifFolder)
    notif.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    notif.BorderSizePixel = 0
    notif.Size = UDim2.new(0, 250, 0, 40)
    notif.AnchorPoint = Vector2.new(1, 1)
    notif.Position = UDim2.new(1, 0, 1, 0)
    notif.BackgroundTransparency = 0
    Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 8)

    local label = Instance.new("TextLabel", notif)
    label.Size = UDim2.new(1, -20, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = info.Text or "Notification"
    label.Font = Enum.Font.SourceSans
    label.TextSize = 20
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.TextStrokeColor3 = Color3.new(0, 0, 0)
    label.TextStrokeTransparency = 0.7

    self.NotifFolder.Size = UDim2.new(0, 250, 0, self.UIListLayout.AbsoluteContentSize.Y + 45)

    local tweenOut = TweenService:Create(notif, TweenInfo.new(0.5), {BackgroundTransparency = 1})
    delay(info.Duration or 3, function()
        tweenOut:Play()
        tweenOut.Completed:Wait()
        notif:Destroy()
        self.NotifFolder.Size = UDim2.new(0, 250, 0, self.UIListLayout.AbsoluteContentSize.Y + 45)
    end)
end

return Library.new()