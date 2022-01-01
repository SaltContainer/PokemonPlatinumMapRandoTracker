DoorSlotSelection = CustomItem:extend()
DoorSlotSelection.Types = {
    [1] = "unknown",
    [2] = "one_way",
    [3] = "dead_end",
    [4] = "event",
    [5] = "trainer",
    [6] = "coal_badge",
    [7] = "forest_badge",
    [8] = "cobble_badge",
    [9] = "fen_badge",
    [10] = "relic_badge",
    [11] = "mine_badge",
    [12] = "icicle_badge",
    [13] = "beacon_badge",
    [14] = "e4_bug",
    [15] = "e4_ground",
    [16] = "e4_fire",
    [17] = "e4_psychic",
    [18] = "champ",
    [19] = "cut",
    [20] = "rock_smash",
    [21] = "strength",
    [22] = "surf",
    [23] = "waterfall",
    [24] = "rock_climb",
    [25] = "hm1",
    [26] = "hm2",
    [27] = "hm3",
    [28] = "hm4",
    [29] = "hm5",
    [30] = "hm6",
    [31] = "hm7",
    [32] = "hm8",
    [33] = "custom1",
    [34] = "custom2",
    [35] = "custom3",
    [36] = "custom4",
    [37] = "custom5",
    [38] = "custom6",
    [39] = "custom7",
    [40] = "custom8",
    [41] = "center",
    [42] = "mart",
    [43] = "bike",
    [44] = "1",
    [45] = "2",
    [46] = "3",
    [47] = "4",
    [48] = "5",
    [49] = "6",
    [50] = "7",
    [51] = "8",
    [52] = "acuity_lakefront",
    [53] = "canalave",
    [54] = "celestic",
    [55] = "coronet",
    [56] = "coronet_peak",
    [57] = "dept",
    [58] = "eterna",
    [59] = "eterna_galactic",
    [60] = "fight_area",
    [61] = "floaroma",
    [62] = "eterna_forest",
    [63] = "galactic_hq",
    [64] = "hearthome",
    [65] = "iron_island",
    [66] = "fuego_ironworks",
    [67] = "jubilife",
    [68] = "jubilife_tv",
    [69] = "league",
    [70] = "mansion",
    [71] = "floaroma_meadow",
    [72] = "oreburgh",
    [73] = "pastoria",
    [74] = "poketch",
    [75] = "resort_area",
    [76] = "solaceon_ruins",
    [77] = "sandgem",
    [78] = "snowpoint",
    [79] = "solaceon",
    [80] = "spring_path",
    [81] = "stark",
    [82] = "sunyshore",
    [83] = "survival_area",
    [84] = "valor_lakefront",
    [85] = "veilstone",
    [86] = "verity_lakefront",
    [87] = "victory_road",
    [88] = "valley_windworks",
    [89] = "route_203",
    [90] = "route_204",
    [91] = "route_205",
    [92] = "route_206",
    [93] = "route_207",
    [94] = "route_208",
    [95] = "route_209",
    [96] = "route_210",
    [97] = "route_211",
    [98] = "route_212",
    [99] = "route_213",
    [100] = "route_214",
    [101] = "route_215",
    [102] = "route_216",
    [103] = "route_217",
    [104] = "route_221",
    [105] = "route_222",
    [106] = "route_225",
    [107] = "route_226",
    [108] = "route_227",
    [109] = "route_228",
    [110] = "old_chateau",
    [111] = "oreburgh_gate"
}
DoorSlotSelection.Selection = 2

function DoorSlotSelection:init(index)
    self:createItem("Door Slot Selection")
    self.index = index
    self.code = "doorslot_" .. DoorSlotSelection.Types[index]
    self.image = DoorSlot.Icons[index]

    self:setState(0)
end

function DoorSlotSelection:setState(state)
    self:setProperty("state", state)
end

function DoorSlotSelection:getState()
    return self:getProperty("state")
end

function DoorSlotSelection:updateIcon()
    local overlay = ""
    if self:getState() > 0 then
        if DoorSlotSelection.Selection < 52 then
            overlay = "overlay|images/other/selected_tag.png"
        else
            overlay = "overlay|images/other/selected_hub.png"
        end
    end

    self.ItemInstance.Icon = ImageReference:FromPackRelativePath("images/" .. self.image .. ".png", overlay)
end

function DoorSlotSelection:updateNeighbors()
    for i = 1, #DoorSlot.Icons do
        if DoorSlotSelection.Types[i] and self.index ~= i then
            local item = Tracker:FindObjectForCode("doorslot_" .. DoorSlotSelection.Types[i])
            if item then
                item.ItemState:setState(0)
            end
        end
    end
end

function DoorSlotSelection:onLeftClick()
    local selection = self.index
    local current_warp = Tracker:FindObjectForCode(DoorSlot.Selection).ItemState
    local current_warp_hub = current_warp.hubIcon
    if current_warp and current_warp_hub then
        current_warp:setState(selection)
        current_warp_hub:setState(selection)
        if selection < 52 then
            current_warp.ItemInstance.Icon = ImageReference:FromPackRelativePath("images/" .. DoorSlot.Icons[selection] .. ".png", "overlay|images/other/selected_tag.png")
        else
            current_warp_hub.ItemInstance.Icon = ImageReference:FromPackRelativePath("images/" .. DoorSlot.Icons[selection] .. ".png", "overlay|images/other/selected_hub.png")
        end
    end
end

function DoorSlotSelection:onRightClick()
    DoorSlotSelection.Selection = self.index
    self:setState(1)
    self:updateNeighbors()
end

function DoorSlotSelection:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function DoorSlotSelection:providesCode(code)
    if code == self.code and self:getState() ~= 0 then
        return self:getState()
    end
    return 0
end

function DoorSlotSelection:advanceToCode(code)
    if code == nil or code == self.code then
        self:setState((self:getState() + 1) % 2)
    end
end

function DoorSlotSelection:propertyChanged(key, value)
    if key == "state" then
        self:updateIcon()
    end
end
