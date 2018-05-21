local server = "25.2.197.222"
local serverport = 8080
local clientport = 0
desiredusername = "Player"

--NOTE, IF YOU DONT HAVE A CHOICE FOR THE OPTION, PUT none AS THE VALUE.--
hat1id = "none" --Put a Hat ID.
hat2id = "none" --Put a Hat ID.
hat3id = "none" --Put a Hat ID.
tshirtid = "none" --Put your T-Shirt ID.
shirtid = "none" --Put a Shirt ID.
pantsid = "none" --Put a Pants ID.
bodycid = "none" --Put your bodycolors ID (Has to be a user ID).

function dieerror(errmsg)
game:SetMessage(errmsg)
wait(math.huge)
end

local suc, err = pcall(function()
client = game:GetService("NetworkClient")
player = game:GetService("Players"):CreateLocalPlayer(0)
player:SetSuperSafeChat(false)
player.CharacterAppearance = "http://www.roblox.com/asset/?id="..hat1id.."&version=1;http://www.roblox.com/asset/?id="..hat2id.."&version=1;http://www.roblox.com/asset/?id="..hat3id.."&version=1;http://www.roblox.com/asset/?id="..shirtid..";http://www.roblox.com/asset/?id="..pantsid..";http://www.roblox.com/Asset/BodyColors.ashx?userId="..bodycid..";http://www.roblox.com/asset/?id="..tshirtid
game:GetService("Visit")
end)

if not suc then
dieerror(err)
end

function connected(url, replicator)
local suc, err = pcall(function()
--game:SetMessageBrickCount()
local marker = replicator:SendMarker()
end)
if not suc then
dieerror(err)
end
marker.Recieved:wait()
local suc, err = pcall(function()
game:ClearMessage()
end)
if not suc then
dieerror(err)
end
end

function rejected()
dieerror("PWNED, YOU GOT REJECTED BY A SERVER.")
end

function failed(peer, errcode, why)
dieerror("Failed [".. peer.. "], ".. errcode.. ": ".. why)
end

local suc, err = pcall(function()
client.ConnectionAccepted:connect(connected)
client.ConnectionRejected:connect(rejected)
client.ConnectionFailed:connect(failed)
client:Connect(server, serverport, clientport, 20)
end)

if not suc then
local x = Instance.new("Message")
x.Text = err
x.Parent = workspace
wait(math.huge)
end

while true do
wait(0.001)
replicator:SendMarker()
end
--note this server script was made by EC and edited by UsernameInput (kinery)(Patched By Scripter)
