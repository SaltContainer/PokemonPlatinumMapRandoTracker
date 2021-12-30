DoorSlot = CustomItem:extend()
DoorSlot.Icons = {
    [0] = "none",
    [1] = "other/unknown",
    [2] = "other/one_way",
    [3] = "other/dead_end",
    [4] = "other/event",
    [5] = "other/trainer",
    [6] = "badges/coal_badge",
    [7] = "badges/forest_badge",
    [8] = "badges/cobble_badge",
    [9] = "badges/fen_badge",
    [10] = "badges/relic_badge",
    [11] = "badges/mine_badge",
    [12] = "badges/icicle_badge",
    [13] = "badges/beacon_badge",
    [14] = "gyms/e4_bug",
    [15] = "gyms/e4_ground",
    [16] = "gyms/e4_fire",
    [17] = "gyms/e4_psychic",
    [18] = "gyms/champ",
    [19] = "hms/cut",
    [20] = "hms/rock_smash",
    [21] = "hms/strength",
    [22] = "hms/surf",
    [23] = "hms/waterfall",
    [24] = "hms/rock_climb",
    [25] = "hms/hm1",
    [26] = "hms/hm2",
    [27] = "hms/hm3",
    [28] = "hms/hm4",
    [29] = "hms/hm5",
    [30] = "hms/hm6",
    [31] = "hms/hm7",
    [32] = "hms/hm8",
    [33] = "types/normal",
    [34] = "types/water",
    [35] = "types/grass",
    [36] = "types/electric",
    [37] = "types/poison",
    [38] = "types/fairy",
    [39] = "types/steel",
    [40] = "types/dragon",
    [41] = "other/center",
    [42] = "other/mart",
    [43] = "other/bike",
    [44] = "numbers/1",
    [45] = "numbers/2",
    [46] = "numbers/3",
    [47] = "numbers/4",
    [48] = "numbers/5",
    [49] = "numbers/6",
    [50] = "numbers/7",
    [51] = "numbers/8",
    [52] = "locations/acuity_lakefront",
    [53] = "locations/canalave",
    [54] = "locations/celestic",
    [55] = "locations/coronet",
    [56] = "locations/coronet_peak",
    [57] = "locations/dept",
    [58] = "locations/eterna",
    [59] = "locations/eterna_galactic",
    [60] = "locations/fight_area",
    [61] = "locations/floaroma",
    [62] = "locations/eterna_forest",
    [63] = "locations/galactic_hq",
    [64] = "locations/hearthome",
    [65] = "locations/iron_island",
    [66] = "locations/fuego_ironworks",
    [67] = "locations/jubilife",
    [68] = "locations/jubilife_tv",
    [69] = "locations/league",
    [70] = "locations/mansion",
    [71] = "locations/floaroma_meadow",
    [72] = "locations/oreburgh",
    [73] = "locations/pastoria",
    [74] = "locations/poketch",
    [75] = "locations/resort_area",
    [76] = "locations/solaceon_ruins",
    [77] = "locations/sandgem",
    [78] = "locations/snowpoint",
    [79] = "locations/solaceon",
    [80] = "locations/spring_path",
    [81] = "locations/stark",
    [82] = "locations/sunyshore",
    [83] = "locations/survival_area",
    [84] = "locations/valor_lakefront",
    [85] = "locations/veilstone",
    [86] = "locations/verity_lakefront",
    [87] = "locations/victory_road",
    [88] = "locations/valley_windworks",
    [89] = "locations/route_203",
    [90] = "locations/route_204",
    [91] = "locations/route_205",
    [92] = "locations/route_206",
    [93] = "locations/route_207",
    [94] = "locations/route_208",
    [95] = "locations/route_209",
    [96] = "locations/route_210",
    [97] = "locations/route_211",
    [98] = "locations/route_212",
    [99] = "locations/route_213",
    [100] = "locations/route_214",
    [101] = "locations/route_215",
    [102] = "locations/route_216",
    [103] = "locations/route_217",
    [104] = "locations/route_221",
    [105] = "locations/route_222",
    [106] = "locations/route_225",
    [107] = "locations/route_226",
    [108] = "locations/route_227",
    [109] = "locations/route_228"
}
DoorSlot.Selection = "slot_acuity_1"

function DoorSlot:init(roomSlot, doorSlot)
    self:createItem("Door Slot")
    self.code = "slot_" .. roomSlot .. "_" .. doorSlot
    self.roomSlot = roomSlot
    self.doorSlot = doorSlot
    self.hubIcon = nil

    self:setState(1)
end

function DoorSlot:setHubIcon(hubIcon)
    self.hubIcon = hubIcon
end

function DoorSlot:setSelection()
    DoorSlot.Selection = self.code
end

function DoorSlot:removeSelectionOverlay()
    local current_warp = Tracker:FindObjectForCode(DoorSlot.Selection).ItemState
    local state = current_warp:getState()
    if state < 52 then
        current_warp.ItemInstance.Icon = ImageReference:FromPackRelativePath("images/" .. DoorSlot.Icons[state] .. ".png", "")
    else
        current_warp = Tracker:FindObjectForCode("hub" .. DoorSlot.Selection).ItemState
        current_warp.ItemInstance.Icon = ImageReference:FromPackRelativePath("images/" .. DoorSlot.Icons[state] .. ".png", "")
    end
end

function DoorSlot:addSelectionOverlay()
    local state = self:getState()
    if state < 52 then
        local current_warp = Tracker:FindObjectForCode(DoorSlot.Selection).ItemState
        current_warp.ItemInstance.Icon = ImageReference:FromPackRelativePath("images/" .. DoorSlot.Icons[state] .. ".png", "overlay|images/other/selected_tag.png")
    else
        local current_warp = Tracker:FindObjectForCode("hub" .. DoorSlot.Selection).ItemState
        current_warp.ItemInstance.Icon = ImageReference:FromPackRelativePath("images/" .. DoorSlot.Icons[state] .. ".png", "overlay|images/other/selected_hub.png")
    end
end

function DoorSlot:setState(state)
    self:setProperty("state", state)
end

function DoorSlot:getState()
    return self:getProperty("state")
end

function DoorSlot:updateIcon()
    if self:getState() < 52 then
        local img = DoorSlot.Icons[self:getState()]
        local imgPath = "images/" .. img .. ".png"
        local overlay = ""
        if self.code == DoorSlot.Selection then
            overlay = "overlay|images/other/selected_tag.png"
        end
        self.ItemInstance.Icon = ImageReference:FromPackRelativePath(imgPath, overlay)
    else
        self.ItemInstance.Icon = nil
    end
end

function DoorSlot:onLeftClick()
    self:removeSelectionOverlay()
    self:setSelection()
    self:addSelectionOverlay()
end

function DoorSlot:onRightClick()
    local state = DoorSlotSelection.Selection
    self:setState(state)
    self.hubIcon:setState(state)
end

function DoorSlot:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function DoorSlot:providesCode(code)
    if code == self.code and self:getState() ~= 0 then
        return self:getState()
    end
    return 0
end

function DoorSlot:advanceToCode(code)
    if code == nil or code == self.code then
        self:setState((self:getState() + 1) % #self.Icons)
    end
end

function DoorSlot:propertyChanged(key, value)
    if key == "state" then
        self:updateIcon()
    end
end
