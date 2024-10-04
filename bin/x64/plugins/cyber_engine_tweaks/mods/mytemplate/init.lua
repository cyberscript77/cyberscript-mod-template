
local init_version = "1.0"

local mod = { 
	
	datapack = {}
}



JSON = assert(loadfile("libs/json.lua"))()
cyberlibs = assert(loadfile("libs/cyberlibs.lua"))()
	
registerForEvent("onInit", function()
	cyberlibs.init(mod)
end)


function mod.compile()
	return cyberlibs.ImportDataPackFolder()
end
	
return mod