ScriptHost:LoadScript("scripts/doors/locations/AbandonedShip.lua")
ScriptHost:LoadScript("scripts/doors/locations/AquaHideout.lua")
ScriptHost:LoadScript("scripts/doors/locations/DewfordTown.lua")
ScriptHost:LoadScript("scripts/doors/locations/EverGrandeCity.lua")
ScriptHost:LoadScript("scripts/doors/locations/FallarborTown.lua")
ScriptHost:LoadScript("scripts/doors/locations/FortreeCity.lua")
ScriptHost:LoadScript("scripts/doors/locations/GraniteCave.lua")
ScriptHost:LoadScript("scripts/doors/locations/JaggedPass.lua")
ScriptHost:LoadScript("scripts/doors/locations/LavaridgeTown.lua")
ScriptHost:LoadScript("scripts/doors/locations/LilycoveCity.lua")
ScriptHost:LoadScript("scripts/doors/locations/MagmaHideout.lua")
ScriptHost:LoadScript("scripts/doors/locations/MauvilleCity.lua")
ScriptHost:LoadScript("scripts/doors/locations/MeteorFalls.lua")
ScriptHost:LoadScript("scripts/doors/locations/MirageTower.lua")
ScriptHost:LoadScript("scripts/doors/locations/MossdeepCity.lua")
ScriptHost:LoadScript("scripts/doors/locations/MtPyre.lua")
ScriptHost:LoadScript("scripts/doors/locations/NavelRock.lua")
ScriptHost:LoadScript("scripts/doors/locations/OldaleTown.lua")
ScriptHost:LoadScript("scripts/doors/locations/PacifidlogTown.lua")
ScriptHost:LoadScript("scripts/doors/locations/PetalburgCity.lua")
ScriptHost:LoadScript("scripts/doors/locations/PetalburgWoods.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route104.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route105.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route106.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route108.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route109.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route110.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route111.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route112.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route113.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route114.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route115.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route116.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route117.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route119.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route120.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route122.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route123.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route124.lua")
ScriptHost:LoadScript("scripts/doors/locations/RustboroCity.lua")
ScriptHost:LoadScript("scripts/doors/locations/RusturfTunnel.lua")
ScriptHost:LoadScript("scripts/doors/locations/SeafloorCavern.lua")
ScriptHost:LoadScript("scripts/doors/locations/SkyPillar.lua")
ScriptHost:LoadScript("scripts/doors/locations/SlateportCity.lua")
ScriptHost:LoadScript("scripts/doors/locations/SootopolisCity.lua")
ScriptHost:LoadScript("scripts/doors/locations/Underwater.lua")
ScriptHost:LoadScript("scripts/doors/locations/VerdanturfTown.lua")
ScriptHost:LoadScript("scripts/doors/locations/VictoryRoad.lua")

for t = 1, #DoorSlot.Icons do
    if DoorSlotSelection.Types[t] then
        DoorSlotSelection(t)
    end
end

local dead_end = Tracker:FindObjectForCode("doorslot_dead_end")
if dead_end then
    dead_end.ItemState:onRightClick()
end