script by coke, thanks man.

--properties for player
username = "betatester"
userid = 0
appearance = "http://www.roblox.com/asset/?id=16218214&version=1"

--create the local player
local player = game.Players:CreateLocalPlayer(userid)
pcall(function() player.Name = username end)
player.CharacterAppearance = appearance

--start the play solo
game:GetService("RunService"):Run()
game:GetService("Visit")
function deathmonitor()
    if player.Character ~= nil then
        player.Character.Humanoid.Died:connect(died)
    end
end
function died()
    wait(5)
    player:LoadCharacter()
    deathmonitor()
end
player:LoadCharacter()
deathmonitor()
