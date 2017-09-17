
-- config.lua

-- Contains all the functions to load the config





g_ConfigDefaults = 
[[
Inventory        = true,
]]





function LoadDefaultSettings()
	g_Config = loadstring("return {" .. g_ConfigDefaults .. "}")()
end



function LoadSettings()
	local Path = g_Plugin:GetLocalFolder() .. "/config.cfg"
	if (not cFile:IsFile(Path)) then
		LOGWARNING("[DeathProtect] The config file doesn't exist. DeathProtect will use the default settings for now")
		LoadDefaultSettings()
		return
	end
	
	local ConfigContent = cFile:ReadWholeFile(Path)
	if (ConfigContent == "") then
		LOGWARNING("[DeathProtect] The config file is empty. DeathProtect will use the default settings for now")
		LoadDefaultSettings()
		return
	end
	
	local ConfigLoader, Error  = loadstring("return {" .. ConfigContent .. "}")
	if (not ConfigLoader) then
		LOGWARNING("[DeathProtect] There is a problem in the config file. DeathProtect will use the default settings for now.")
		LoadDefaultSettings()
		return
	end
	
	local Result, ConfigTable, Error = pcall(ConfigLoader)
	if (not Result) then
		LOGWARNING("[DeathProtect] There is a problem in the config file. DeathProtect will use the default settings for now.")
		LoadDefaultSettings()
		return
	end
	
	g_Config = ConfigTable
	
end




	