local _, addon = ...
local frame = CreateFrame("Frame")
local L = addon.L
LibStub("LibSink-2.0"):Embed(addon)

local throttle = {}





local originalOnEvent = UIErrorsFrame:GetScript("OnEvent")

UIErrorsFrame:SetScript("OnEvent", function(self, event, ...)
	print('ERROR.. from MatchAnalyzer OnEvent')
	print(self)
	print(event)
	print(...)
end)

frame:SetScript("OnEvent", function(self, event, addonName)
	print('hello frame .. from MatchAnalyzer frame:setScript OnEvent')
	print('Addon Var: ' .. addonName)
	if addonName == "MatchAnalyzer" then
		print('is MatchAnalyzer')
		addon.db = LibStub("AceDB-3.0"):New("MatchAnalyzerDB", {
			profile = {
				sink20OutputSink = "UIErrorsFrame",
				errors = true,
				information = false,
				system = false,
				combat = false,
			},
		}, true)
		
		testFn()
		-- addon:SetSinkStorage(addon.db.profile)
		-- LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("MatchAnalyzer", args)
		-- LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("MatchAnalyzer-Output", function() return addon:GetSinkAce3OptionsDataTable() end)
		-- LibStub("AceConfigDialog-3.0"):AddToBlizOptions("MatchAnalyzer", "MatchAnalyzer")
		-- LibStub("AceConfigDialog-3.0"):AddToBlizOptions("MatchAnalyzer-Output", L.output, "MatchAnalyzer")
		
		-- self:UnregisterEvent("ADDON_LOADED")
		-- self:SetScript("OnEvent", function() wipe(throttle) end)
		-- self:RegisterEvent("PLAYER_ENTERING_WORLD")
	end
	print('Not MatchAnalyzer')
end)

function testFn()
	print('testFn fn')
end



frame:RegisterEvent("ADDON_LOADED")

