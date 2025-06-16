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
        Game.SetTextBackground(false)
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
                if Game.IsGameKeyboardKeyPressed(42) and Game.IsGameKeyboardKeyPressed(17) then -- Turn Left Forward - Q + W
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, 0.5, 0.5)
                    )
                elseif Game.IsGameKeyboardKeyPressed(29) and Game.IsGameKeyboardKeyPressed(17) then -- Turn Right Forward - E + W
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, 0.5, -0.5)
                    )
                elseif Game.IsGameKeyboardKeyPressed(42) and Game.IsGameKeyboardKeyPressed(31) then -- Turn Left Back - Q + S
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, -0.5, -0.5)
                    )
                elseif Game.IsGameKeyboardKeyPressed(29) and Game.IsGameKeyboardKeyPressed(31) then -- Turn Right Back - E + S
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, -0.5, 0.5)
                    )
                elseif Game.IsGameKeyboardKeyPressed(42) then -- UP - L-SHIFT
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, 0, 0.5)
                    )
                elseif Game.IsGameKeyboardKeyPressed(29) then -- Down - L-CTRL
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, 0, -0.5)
                    )
                elseif Game.IsGameKeyboardKeyPressed(16) and Game.IsGameKeyboardKeyPressed(17) then -- Turn Left Forward - Q + W
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharHeading(playerChar, r + 1)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, 0.5, 0)
                    )
                elseif Game.IsGameKeyboardKeyPressed(18) and Game.IsGameKeyboardKeyPressed(17) then -- Turn Right Forward - E + W
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharHeading(playerChar, r - 1)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, 0.5, 0)
                    )
                elseif Game.IsGameKeyboardKeyPressed(16) and Game.IsGameKeyboardKeyPressed(31) then -- Turn Left Back - Q + S
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharHeading(playerChar, r - 1)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, -0.5, 0)
                    )
                elseif Game.IsGameKeyboardKeyPressed(18) and Game.IsGameKeyboardKeyPressed(31) then -- Turn Right Back - E + S
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharHeading(playerChar, r + 1)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, -0.5, 0)
                    )
                elseif Game.IsGameKeyboardKeyPressed(17) then -- Forward - W
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, 0.5, 0)
                    )
                elseif Game.IsGameKeyboardKeyPressed(31) then -- Back - S
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0, -0.5, 0)
                    )
                elseif Game.IsGameKeyboardKeyPressed(30) then -- Left - A
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, -0.5, 0, 0)
                    )
                elseif Game.IsGameKeyboardKeyPressed(32) then -- Right - D
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharCoordinatesNoOffset(
                        playerChar,
                        Game.GetOffsetFromCharInWorldCoords(playerChar, 0.5, 0, 0)
                    )
                elseif Game.IsGameKeyboardKeyPressed(16) then -- Turn Left - Q
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharHeading(playerChar, r + 1.5)
                elseif Game.IsGameKeyboardKeyPressed(18) then -- Turn Right - E
                    local playerId = Game.GetPlayerId()
                    local playerChar = Game.GetPlayerChar(playerId)
                    local r = Game.GetCharHeading(playerChar)
                    Game.SetCharHeading(playerChar, r - 1.5)
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
