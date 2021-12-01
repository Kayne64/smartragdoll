local config = {  
    key = 303, -- U KEY, Find more at https://docs.fivem.net/docs/game-references/controls/
    stamina = 50, -- If stamina is less than the number it will ragdoll until it is regained
}

--Variables
local player = GetPlayerPed(-1)
local stamina = GetPlayerSprintStaminaRemaining(player)
--End

--Keybind to Ragdoll
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        if IsControlPressed(1, config.key) then 
            SetPedToRagdoll(player, 1000, 1000, 0, true, true, false)
        end 
    end
end)

--Ragdoll if Stamina is less than defined
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        if IsPedJumping(player) and stamina < config.stamina then
            SetPedToRagdoll(player, 1000, 1000, 0, true, true, false)
end)