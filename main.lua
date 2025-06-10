InNoclip = false

function noclip()
    local playerId = Game.GetPlayerId()
    local playerIndex = Game.ConvertIntToPlayerindex(playerId)
    local playerChar = Game.GetPlayerChar(playerIndex)
    Game.SetCharVisible(playerChar, not InNoclip)
    Game.SetPlayerControl(playerIndex, not InNoclip)
    Game.SetCharCollision(playerChar, not InNoclip)
    Game.SetPlayerInvincible(playerIndex, InNoclip)
    Game.SetCharNeverTargetted(playerChar, InNoclip)
    Game.FreezeCharPosition(playerChar, InNoclip)
    Events.Call("skynoclip:Toggle", { InNoclip })
    Events.CallRemote("skynoclip:Toggle", { InNoclip })
    if InNoclip then
        Game.PrintHelpForever("NOCLIP_HLP")
    else
        Game.ClearHelp()
    end
end

Events.Subscribe("chatCommand", function(fullcommand)
    local command = strsplit(fullcommand, ' ')
    if command[1] == "/noclip" then
        InNoclip = not InNoclip
        if InNoclip then
            Chat.AddMessage("System: Noclip Enabled")
        else
            Chat.AddMessage("System: Noclip Disabled")
        end
        noclip()
    end
end)

-- From the default Lua Gamemode
function strsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}; i = 1
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

Events.Subscribe("scriptInit", function()
    Thread.Create(function()
        while true do
            while InNoclip do
                if Game.IsGameKeyboardKeyPressed(42) then -- UP - L-SHIFT
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local x, y, z = Game.GetCharCoordinates(playerChar)
                    local r = Game.GetCharHeading(playerChar)
                    z = z + 0.5
                    Game.SetCharCoordinatesNoOffset(playerChar, x, y, z)
                    Game.SetCharHeading(playerChar, r)
                elseif Game.IsGameKeyboardKeyPressed(29) then -- Down - L-CTRL
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local x, y, z = Game.GetCharCoordinates(playerChar)
                    local r = Game.GetCharHeading(playerChar)
                    z = z - 0.5
                    Game.SetCharCoordinatesNoOffset(playerChar, x, y, z)
                    Game.SetCharHeading(playerChar, r)
                elseif Game.IsGameKeyboardKeyPressed(17) then -- Forward - W
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local x, y, z = Game.GetCharCoordinates(playerChar)
                    local r = Game.GetCharHeading(playerChar)
                    x = x + 0.5
                    Game.SetCharCoordinatesNoOffset(playerChar, x, y, z)
                    Game.SetCharHeading(playerChar, r)
                elseif Game.IsGameKeyboardKeyPressed(31) then -- Back - S
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local x, y, z = Game.GetCharCoordinates(playerChar)
                    local r = Game.GetCharHeading(playerChar)
                    x = x - 0.5
                    Game.SetCharCoordinatesNoOffset(playerChar, x, y, z)
                    Game.SetCharHeading(playerChar, r)
                elseif Game.IsGameKeyboardKeyPressed(30) then -- Left - A
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local x, y, z = Game.GetCharCoordinates(playerChar)
                    local r = Game.GetCharHeading(playerChar)
                    y = y - 0.5
                    Game.SetCharCoordinatesNoOffset(playerChar, x, y, z)
                    Game.SetCharHeading(playerChar, r)
                elseif Game.IsGameKeyboardKeyPressed(32) then -- Left - D
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local x, y, z = Game.GetCharCoordinates(playerChar)
                    local r = Game.GetCharHeading(playerChar)
                    y = y + 0.5
                    Game.SetCharCoordinatesNoOffset(playerChar, x, y, z)
                    Game.SetCharHeading(playerChar, r)
                end
                Thread.Pause(0)
            end
            Thread.Pause(0)
        end
    end)
end)

Events.Subscribe("scriptInit", function()
    Text.AddEntry(
        "NOCLIP_HLP",
        "X: ~INPUT_MOVE_UP~/~INPUT_MOVE_DOWN~ ~n~Y: ~INPUT_MOVE_LEFT~/~INPUT_MOVE_RIGHT~ ~n~Z: ~INPUT_SPRINT~/~INPUT_DUCK~"
    )
end)
