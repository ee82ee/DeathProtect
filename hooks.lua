
-- hooks.lua

-- Contains the hook functions


function OnKilling(victim, killer, takeDamageInfo)
	-- only take effects on player
	if (not victim:IsPlayer()) then
		return false
	end
	
	-- save inventory
	if (g_Config.Inventory) then
		g_Inventors[victim] = cItems()
		local inventory = victim:GetInventory()
		inventory:CopyToItems(g_Inventors[victim])
		inventory:Clear()
	end
	
	return true
end


function OnRespawned(victim)
	-- only take effects on player
	if (not victim:IsPlayer()) then
		return false
	end
	
	-- restore inventory
	if (g_Config.Inventory and g_Inventors[victim]) then
		victim:GetInventory():AddItems(g_Inventors[victim], true)
		g_Inventors[victim] = nil
		LOG(victim:GetName().. "'s inventory restored")
	end
	
	return true
end

