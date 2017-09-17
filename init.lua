
-- init.lua

-- Contains the initialization function, and the disabling function.



g_Plugin          = nil;
g_Config          = nil;
g_Inventors       = {};


function Initialize(a_Plugin)
	a_Plugin:SetName("DeathProtect")
	a_Plugin:SetVersion(1)
	g_Plugin = a_Plugin
	
	LoadSettings()
	
	cPluginManager:AddHook(cPluginManager.HOOK_KILLING, OnKilling)
	cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_SPAWNED, OnRespawned)
	return true
end

function OnDisable()
	LOG("DeathProtect v" .. g_Plugin:GetVersion() .. " is disabling")
end
