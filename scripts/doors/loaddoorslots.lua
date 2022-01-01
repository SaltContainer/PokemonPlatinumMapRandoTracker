ScriptHost:LoadScript("scripts/doors/locations/AcuityLakefront.lua")
ScriptHost:LoadScript("scripts/doors/locations/Canalave.lua")
ScriptHost:LoadScript("scripts/doors/locations/Celestic.lua")
ScriptHost:LoadScript("scripts/doors/locations/Coronet.lua")
ScriptHost:LoadScript("scripts/doors/locations/CoronetPeak.lua")
ScriptHost:LoadScript("scripts/doors/locations/Dept.lua")
ScriptHost:LoadScript("scripts/doors/locations/Eterna.lua")
ScriptHost:LoadScript("scripts/doors/locations/EternaForest.lua")
ScriptHost:LoadScript("scripts/doors/locations/EternaGalactic.lua")
ScriptHost:LoadScript("scripts/doors/locations/FightArea.lua")
ScriptHost:LoadScript("scripts/doors/locations/Floaroma.lua")
ScriptHost:LoadScript("scripts/doors/locations/FloaromaMeadow.lua")
ScriptHost:LoadScript("scripts/doors/locations/FuegoIronworks.lua")
ScriptHost:LoadScript("scripts/doors/locations/GalacticHQ.lua")
ScriptHost:LoadScript("scripts/doors/locations/Hearthome.lua")
ScriptHost:LoadScript("scripts/doors/locations/IronIsland.lua")
ScriptHost:LoadScript("scripts/doors/locations/Jubilife.lua")
ScriptHost:LoadScript("scripts/doors/locations/JubilifeTV.lua")
ScriptHost:LoadScript("scripts/doors/locations/League.lua")
ScriptHost:LoadScript("scripts/doors/locations/Mansion.lua")
ScriptHost:LoadScript("scripts/doors/locations/OldChateau.lua")
ScriptHost:LoadScript("scripts/doors/locations/Oreburgh.lua")
ScriptHost:LoadScript("scripts/doors/locations/Pastoria.lua")
ScriptHost:LoadScript("scripts/doors/locations/Poketch.lua")
ScriptHost:LoadScript("scripts/doors/locations/ResortArea.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route203.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route204.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route205.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route206.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route207.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route208.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route209.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route210.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route211.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route212.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route213.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route214.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route215.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route216.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route217.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route221.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route222.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route225.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route226.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route227.lua")
ScriptHost:LoadScript("scripts/doors/locations/Route228.lua")
ScriptHost:LoadScript("scripts/doors/locations/Sandgem.lua")
ScriptHost:LoadScript("scripts/doors/locations/Snowpoint.lua")
ScriptHost:LoadScript("scripts/doors/locations/Solaceon.lua")
ScriptHost:LoadScript("scripts/doors/locations/SolaceonRuins.lua")
ScriptHost:LoadScript("scripts/doors/locations/SpringPath.lua")
ScriptHost:LoadScript("scripts/doors/locations/Stark.lua")
ScriptHost:LoadScript("scripts/doors/locations/Sunyshore.lua")
ScriptHost:LoadScript("scripts/doors/locations/SurvivalArea.lua")
ScriptHost:LoadScript("scripts/doors/locations/ValleyWindworks.lua")
ScriptHost:LoadScript("scripts/doors/locations/ValorLakefront.lua")
ScriptHost:LoadScript("scripts/doors/locations/Veilstone.lua")
ScriptHost:LoadScript("scripts/doors/locations/VerityLakefront.lua")
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