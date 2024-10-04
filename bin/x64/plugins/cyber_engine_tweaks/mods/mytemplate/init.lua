
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

function mod.readFile(path)
	return cyberlibs.readFile(path)
end

function mod.saveFile(path,objm)
	cyberlibs.saveFile(path,objm)
end

function mod.deleteFile(path)
	cyberlibs.deleteFile(path)
end
	
return mod