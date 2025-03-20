local lastUnit = nil

local function printTooltipPlayer(tooltip)
    local name, unit = tooltip:GetUnit()
    if unit and UnitIsPlayer(unit) then
        local class = UnitClass(unit)
		if lastUnit ~= name then
            lastUnit = name
            print("Hovered over player: " .. name .. " (" .. class .. ")")
        end
    end
end

local frame = CreateFrame("FRAME", "TooltipParsesAddon")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, printTooltipPlayer)
end)