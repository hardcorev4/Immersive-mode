warn("Loading")
local ver = "1.1.0"

local sync = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAcceleration/Comet-Development/refs/heads/main/Doors/Utility/SyncHelper.lua"))()
local seed = game.ReplicatedStorage.GameData.GameSeed.Value
local lastroom = game.ReplicatedStorage.GameData.LatestRoom
local tweenservice = game:GetService("TweenService")
local TextChatService = game:GetService("TextChatService")

local admins = {"SILENCEHARDCORE8","devonpapafrita3"}
local commands = {"SILENCEHARDCORE8","devonpapafrita3","dimaalt4"}

local functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/localplayerr/Doors-stuff/refs/heads/main/Functions"))()

local captions = {"Good Luck","Always look away","Pro tip: press alt f4 for god mode","Do you hear that?","Im kill you if you use custom crucfix","Dont ask who is SILENCEHARDCORE8","ъьъ","Welcome to hell","print(working)","BRBRBRBRBRBB","My english on top","Please give me wave 7 day key","<o_o>","Bet that you cant go past door 30",":skull:","Run VIRUS.exe for 99999 robux","What should i type here?",":cool::cool::cool::cool::cool::cool:","Run _G.stats = 300 command for free admin pannel","Dont beg tags","Happy new year!"}
_G.detph = false
_G.router = false
_G.darkness = false
_G.inspec = false
_G.flame = false

_G.insp = true

local detphsp = {}
local routersp = {}
local darksp = {}
local holesp = {}
local flamesp = {}

for i = 10 , 95 , sync:generateFullRandom(8,10,seed) do
  table.insert(detphsp,sync:generateFullRandom(i - 4,i + 7,seed + i))
end

for i = 8 , 97 , sync:generateFullRandom(10,15,seed) do
  table.insert(routersp,sync:generateFullRandom(i - 6,i + 13,seed + i))
end

for i = 6 , 98 , sync:generateFullRandom(10,14,seed) do
  table.insert(darksp,sync:generateFullRandom(i,i + 16,seed + i))
end

for i = 11 , 95 , sync:generateFullRandom(11,15,seed) do
  table.insert(holesp,sync:generateFullRandom(i - 8,i + 6,seed + i))
end

for i = 10 , 92 , sync:generateFullRandom(10,13,seed) do
  table.insert(flamesp,sync:generateFullRandom(i - 6,i + 10,seed + i))
end

local gui = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Healthbar

gui.Bar.Visible = true

gui.Bar:GetPropertyChangedSignal("Visible"):connect(function() 
    if gui.Bar.Visible == false then 
        gui.Bar.Visible = true 
    end
end)

gui.Position = UDim2.new(0,10,0.945,-10)

local frame = Instance.new("Frame",gui.Bar)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.BackgroundTransparency = 0.7
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.Position = UDim2.new(0.67, 0, 4, 0)
frame.Size = UDim2.new(1.4, 0, 2.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(39,32,32)
local corner = Instance.new("UICorner",frame)
corner.CornerRadius = UDim.new(0.25,0)
local stroke = Instance.new("UIStroke",frame)
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 4
local gradient = Instance.new("UIGradient",stroke)
local red = ColorSequence.new{
	ColorSequenceKeypoint.new(0,Color3.fromRGB(166,51,51)),
	ColorSequenceKeypoint.new(1,Color3.fromRGB(255,101,101))
}
gradient.Color = red
gradient.Rotation = -90
local helperbar = Instance.new("Frame",frame)
helperbar.AnchorPoint = Vector2.new(0.5,0.5)
helperbar.Position = UDim2.new(0.5, 0,0.5, 0)
helperbar.Size = UDim2.new(0.965, 0,0.65,0)
helperbar.BackgroundTransparency = 1
helperbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
helperbar.BorderSizePixel = 0

local bar = Instance.new("Frame",helperbar)
bar.BorderSizePixel = 0
bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar.Size = UDim2.new(0.2,0,1,0)

local corner1 = corner:Clone()
corner1.Parent = bar
local grad = gradient:Clone()
grad.Parent = bar
grad.Color = red

local fold = Instance.new("Folder",game.ReplicatedStorage)
fold.Name = "Fear_stats"
local stats = Instance.new("NumberValue",fold)
stats.Name = "Fear"
stats.Value = 50
local basevalue = Instance.new("NumberValue",fold)
basevalue.Name = "Base_val"
basevalue.Value = -2

stats.Changed:connect(function()
	if stats.Value >= 299 then stats.Value = 300 end
	if stats.Value <= 1 then stats.Value = 0 end
	local anim = tweenservice:Create(bar,TweenInfo.new(5,Enum.EasingStyle.Linear),{Size = UDim2.new(stats.Value / 300,0,1,0)})
	anim:Play()
end)

task.spawn(function()
	while task.wait(5) do
		stats.Value += basevalue.Value
	end
end)

TextChatService.OnIncomingMessage = function(Message)
	if Message.TextSource then
		local player = game.Players:GetPlayerByUserId(Message.TextSource.UserId)
		if player.Name == "dimaalt4" or player.Name == "dima_082ooo" then
			Message.PrefixText = " <font color='#ff007c'>[Script owner]</font> " .. Message.PrefixText
		end
		if table.find(admins,player.Name) then
			Message.PrefixText = " <font color='#00A2FF'>[Admin]</font> " .. Message.PrefixText
		end
		if table.find(commands,player.Name) then
			if Message.Text.find(Message.Text , "/caption") then
				require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(Message.Text:sub(10,Message.Text:len()),true)
			end
		end
	end
end

game.Workspace.CurrentRooms.ChildAdded:connect(function(added)
	local b = added:FindFirstChild("PathFindNodes")
	if b then b = b:Clone() end
	b.Parent = added
end)

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Immersive mode version ".. ver .." ".."successfully loaded",true)
warn("Loaded")


lastroom.changed:wait()

task.spawn(functions.TitleLocation, "The Immersion", 7)

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Immersive mode "..ver.."  activated",true)
task.wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Made by LocalPlayer(dima_082ooo)",true)
task.wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Join this server to support creator https://discord.gg/dCsx7VzFfe",true)
task.wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(captions[sync:generateFullRandom(0,#captions,seed)],true)

task.spawn(function()
	while task.wait(math.random(45,95)) and _G.insp == true do
		--loadstring(game:HttpGet("https://raw.githubusercontent.com/localplayerr/Doors-stuff/refs/heads/main/Immersive%20mode/Inspection"))()
	end
end)

lastroom.changed:connect(function()
    if table.find(detphsp, lastroom.Value) then
	    task.spawn(function()
	        task.wait(sync:generateFullRandom(2,10,lastroom.Value))
		    warn("depth")
	        loadstring(game:HttpGet("https://raw.githubusercontent.com/hardcorev4/Immersive-mode/refs/heads/main/Scripts/Depth"))()
	    end)
    end
    if table.find(routersp, lastroom.Value) then
	    task.spawn(function()
	        task.wait(sync:generateFullRandom(5,20,lastroom.Value))
		    warn("router")
	        loadstring(game:HttpGet("https://raw.githubusercontent.com/hardcorev4/Immersive-mode/refs/heads/main/Scripts/Router"))()
	    end)
    end
	if table.find(darksp, lastroom.Value) then
		task.spawn(function()
	        loadstring(game:HttpGet("https://raw.githubusercontent.com/hardcorev4/Immersive-mode/refs/heads/main/Scripts/Darkness"))()
		end)
    end
	if table.find(holesp, lastroom.Value) then
		task.spawn(function()
	        loadstring(game:HttpGet("https://raw.githubusercontent.com/hardcorev4/Immersive-mode/refs/heads/main/Scripts/Hole"))()
		end)
    end
	if table.find(flamesp, lastroom.Value) then
		task.spawn(function()
			task.wait(0.5)
	        loadstring(game:HttpGet("https://raw.githubusercontent.com/hardcorev4/Immersive-mode/refs/heads/main/Scripts/Flame"))()
		end)
    end
end)
