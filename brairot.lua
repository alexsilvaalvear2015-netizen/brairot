-- BRAIROT HUB COMPLETO

local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BRAIROT_GUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- BOTÓN ABRIR / CERRAR
local toggle = Instance.new("TextButton")
toggle.Parent = gui
toggle.Size = UDim2.new(0, 120, 0, 40)
toggle.Position = UDim2.new(0, 50, 0, 200)
toggle.BackgroundColor3 = Color3.fromRGB(130,130,130)
toggle.Text = "BRAIROT"
toggle.TextColor3 = Color3.new(1,1,1)
toggle.Active = true
toggle.Draggable = true

local strokeToggle = Instance.new("UIStroke", toggle)
strokeToggle.Color = Color3.fromRGB(255,0,0)
strokeToggle.Thickness = 2

-- FRAME MENÚ
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 180, 0, 170)
frame.Position = UDim2.new(0, 50, 0, 250)
frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
frame.Visible = false
frame.Active = true
frame.Draggable = true

local strokeFrame = Instance.new("UIStroke", frame)
strokeFrame.Color = Color3.fromRGB(255,0,0)
strokeFrame.Thickness = 2

-- BOTÓN DUPLICAR
local dup = Instance.new("TextButton")
dup.Parent = frame
dup.Size = UDim2.new(0, 160, 0, 35)
dup.Position = UDim2.new(0, 10, 0, 10)
dup.Text = "Duplicar"
dup.BackgroundColor3 = Color3.fromRGB(200,200,200)

local strokeDup = Instance.new("UIStroke", dup)
strokeDup.Color = Color3.fromRGB(255,0,0)
strokeDup.Thickness = 2

-- BOTÓN VELOCIDAD
local speedBtn = Instance.new("TextButton")
speedBtn.Parent = frame
speedBtn.Size = UDim2.new(0, 160, 0, 35)
speedBtn.Position = UDim2.new(0, 10, 0, 55)
speedBtn.Text = "Subir Velocidad"
speedBtn.BackgroundColor3 = Color3.fromRGB(200,200,200)

local strokeSpeed = Instance.new("UIStroke", speedBtn)
strokeSpeed.Color = Color3.fromRGB(255,0,0)
strokeSpeed.Thickness = 2

-- BOTÓN INFINITE JUMP
local jumpBtn = Instance.new("TextButton")
jumpBtn.Parent = frame
jumpBtn.Size = UDim2.new(0, 160, 0, 35)
jumpBtn.Position = UDim2.new(0, 10, 0, 100)
jumpBtn.Text = "Infinite Jump OFF"
jumpBtn.BackgroundColor3 = Color3.fromRGB(200,200,200)

local strokeJump = Instance.new("UIStroke", jumpBtn)
strokeJump.Color = Color3.fromRGB(255,0,0)
strokeJump.Thickness = 2

-- ABRIR / CERRAR
toggle.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)

-- DUPLICAR TOOL
dup.MouseButton1Click:Connect(function()
	local char = player.Character
	if char then
		for _, v in pairs(char:GetChildren()) do
			if v:IsA("Tool") then
				v:Clone().Parent = player.Backpack
			end
		end
	end
end)

-- VELOCIDAD
speedBtn.MouseButton1Click:Connect(function()
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.WalkSpeed = hum.WalkSpeed + 10
	end
end)

-- INFINITE JUMP
local infJump = false

jumpBtn.MouseButton1Click:Connect(function()
	infJump = not infJump
	jumpBtn.Text = infJump and "Infinite Jump ON" or "Infinite Jump OFF"
end)

UIS.JumpRequest:Connect(function()
	if infJump then
		local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			hum:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)
