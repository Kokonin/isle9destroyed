-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Panel = Instance.new("Frame")
local Goober = Instance.new("ScrollingFrame")
local Texts = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Search = Instance.new("TextBox")
local Close = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Name = tostring(math.random(99999999))

Panel.Name = "Panel"
Panel.Parent = ScreenGui
Panel.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Panel.Position = UDim2.new(0.38378033, 0, 0.349453986, 0)
Panel.Size = UDim2.new(0, 325, 0, 35)
Panel.Active = true
Panel.Draggable = true

Goober.Name = "Goober"
Goober.Parent = Panel
Goober.Active = true
Goober.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Goober.BackgroundTransparency = 1.000
Goober.Position = UDim2.new(0, 0, 1, 0)
Goober.Size = UDim2.new(0, 325, 0, 210)

Texts.Name = "Texts"
Texts.Parent = Goober
Texts.Active = true
Texts.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Texts.Size = UDim2.new(0, 325, 0, 210)
Texts.CanvasSize = UDim2.new(0, 0, 999, 0)

UIListLayout.Parent = Texts
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

Search.Name = "Search"
Search.Parent = Panel
Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Search.BackgroundTransparency = 0.850
Search.Position = UDim2.new(0.024615407, 0, 0.112315133, 0)
Search.Size = UDim2.new(0, 108, 0, 26)
Search.Font = Enum.Font.Arial
Search.Text = ""
Search.TextColor3 = Color3.fromRGB(255, 255, 255)
Search.TextScaled = true
Search.TextSize = 14.000
Search.TextWrapped = true

Close.Name = "Close"
Close.Parent = Panel
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(0.886153817, 0, 0.0857142806, 0)
Close.Size = UDim2.new(0, 28, 0, 28)
Close.Font = Enum.Font.Arial
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true

Close.MouseButton1Click:Connect(function()
    for _, v in pairs(Panel:GetChildren()) do
        v:TweenSize(UDim2.new((UDim2.new(Panel.Size.X,0,0,0)),0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,1.2,true)
        Panel:TweenSize(UDim2.new((UDim2.new(Panel.Size.X,0,0,0)),0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,1.2,true)
    end
    wait(1.3)
    ScreenGui:Destroy()
end)

for _, v in pairs(game.Players:GetChildren()) do
	v.Chatted:Connect(function(msg)
		local TextLabel = Instance.new("TextLabel")
		TextLabel.Parent = Texts
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(0, 302, 0, 27)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.Text = v.DisplayName..": "..msg
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.Name = msg
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
            TextLabel.Visible = true
            if Search.Text ~= "" then
                local labelText = string.lower(TextLabel.Text)
                if string.find(labelText,Search.Text) then
                    TextLabel.Visible = true
                else
                    TextLabel.Visible = false
                end
            end
        end)
	end)
end
