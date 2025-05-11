local module = {}
local runscript = function()
	print("ScriptRan")
end
module.setrunscript = function(c)
	runscript = c
end
local AuthGate = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Input = Instance.new("TextBox")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local CheckKey = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local Spacer = Instance.new("Frame")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local UIStroke = Instance.new("UIStroke")
local UIStroke_2 = Instance.new("UIStroke")
AuthGate.Name = "AuthGate"
AuthGate.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
AuthGate.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Main.Name = "Main"
Main.Parent = AuthGate
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BackgroundTransparency = 0.600
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.50000006, 0)
Main.Size = UDim2.new(0.23944743, 0, 0.26184833, 0)
UICorner.CornerRadius = UDim.new(0.0900000036, 0)
UICorner.Parent = Main
Title.Name = "Title"
Title.Parent = Main
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.5, 0, 0.110859737, 0)
Title.Size = UDim2.new(0.961538434, 0, 0.22624436, 0)
Title.Font = Enum.Font.Gotham
Title.Text = "AUTHGATE"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextYAlignment = Enum.TextYAlignment.Top
UIAspectRatioConstraint.Parent = Title
UIAspectRatioConstraint.AspectRatio = 6.000
Input.Name = "Input"
Input.Parent = Main
Input.AnchorPoint = Vector2.new(0.5, 0.5)
Input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Input.BackgroundTransparency = 1.000
Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
Input.BorderSizePixel = 0
Input.Position = UDim2.new(0.5, 0, 0.386999995, 0)
Input.Size = UDim2.new(0.961538434, 0, 0.22624436, 0)
Input.Font = Enum.Font.Montserrat
Input.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
Input.PlaceholderText = "Please enter key..."
Input.Text = ""
Input.TextColor3 = Color3.fromRGB(0, 0, 0)
Input.TextScaled = true
Input.TextSize = 14.000
Input.TextWrapped = true
Input.TextYAlignment = Enum.TextYAlignment.Center
UIAspectRatioConstraint_2.Parent = Input
UIAspectRatioConstraint_2.AspectRatio = 6.000
CheckKey.Name = "Check Key"
CheckKey.Parent = Main
CheckKey.AnchorPoint = Vector2.new(0.5, 0.5)
CheckKey.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CheckKey.BackgroundTransparency = 0.800
CheckKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
CheckKey.BorderSizePixel = 0
CheckKey.Position = UDim2.new(0.5, 0, 0.771493256, 0)
CheckKey.Size = UDim2.new(0.961538434, 0, 0.343891412, 0)
CheckKey.Font = Enum.Font.SourceSans
CheckKey.Text = "Check Key"
CheckKey.TextColor3 = Color3.fromRGB(0, 0, 0)
CheckKey.TextScaled = true
CheckKey.TextSize = 14.000
CheckKey.TextWrapped = true
UICorner_2.CornerRadius = UDim.new(0.200000003, 0)
UICorner_2.Parent = CheckKey
UIAspectRatioConstraint_3.Parent = CheckKey
UIAspectRatioConstraint_3.AspectRatio = 3.947
Spacer.Name = "Spacer"
Spacer.Parent = Main
Spacer.AnchorPoint = Vector2.new(0.5, 0.5)
Spacer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Spacer.BorderColor3 = Color3.fromRGB(0, 0, 0)
Spacer.BorderSizePixel = 0
Spacer.Position = UDim2.new(0.5, 0, 0.234999999, 0)
Spacer.Size = UDim2.new(1, 0, 0.00499999989, 0)
UIAspectRatioConstraint_4.Parent = Spacer
UIAspectRatioConstraint_4.AspectRatio = 282.353
UIAspectRatioConstraint_5.Parent = Main
UIAspectRatioConstraint_5.AspectRatio = 1.412
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = Main
UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_2.Parent = CheckKey
local waiting = false
local function Check()
	CheckKey.Interactable = false
	waiting = true
	local k = Input.Text
	local ws = WebSocket.connect("wss://record-done-ellis-theoretical.trycloudflare.com")
	local HttpService = game:GetService("HttpService")
	local data = HttpService:JSONEncode({
		hwid = game:GetService("RbxAnalyticsService"):GetClientId(),
		key = k
	})
	CheckKey.Text = "Waiting for server"
	ws.OnMessage:wait()
	ws:Send(data)
	CheckKey.Text = "Checking key"
	ws.OnMessage:Connect(function(msg)
		waiting = false
		ws.Close()
		if msg == "true" then
			CheckKey.Text = "Success!"
			task.wait(1)
			runscript()
			AuthGate:Destroy()
		else
			CheckKey.Text = "Incorrect key"
			task.wait(1)
			CheckKey.Text = "Check Key"
			CheckKey.Interactable = true
		end
	end)
end
local function WaitForServer()
	task.wait(1)
	if waiting then
		task.spawn(function()
			print("rechecking")
			Check()
		end)
		WaitForServer()
	end
end
local function VVJA_fake_script()
	CheckKey.MouseButton1Down:Connect(function()
		task.spawn(function()
			Check()
		end)
		WaitForServer()
	end)
end
VVJA_fake_script()
return module
