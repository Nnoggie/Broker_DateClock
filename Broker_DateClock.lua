local ldb = LibStub("LibDataBroker-1.1")

local Broker_DateClock = ldb:NewDataObject("Broker_DateClock", {
	type = "data source",
	text = ("00:00"),
	value = ("00:00"),
	suffix = "pm",
	icon = "interface\\icons\\inv_misc_pocketwatch_01",
	label = "DateClock",
	OnClick = nil,
	OnTooltipShow = nil,
})

local lastUp = 0
local OnUpdate = CreateFrame("Frame")
OnUpdate:SetScript("OnUpdate", function(self, elap)
	lastUp = lastUp + elap
	if (lastUp>0.15) then
		Broker_DateClock.text = date("%d/%m/%y %H:%M:%S")
		lastUp = lastUp - 1
	end
end)