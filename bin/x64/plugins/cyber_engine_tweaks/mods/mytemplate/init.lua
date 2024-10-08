
local init_version = "1.0"

local mod = { 
	
	datapack = {},
	loaded = false
}



JSON = assert(loadfile("libs/json.lua"))()
cyberlibs = assert(loadfile("libs/cyberlibs.lua"))()

registerForEvent("onUpdate", function(delta)
	if(mod.loaded == false) then
		if GetMod('cyberscript') then 
			cyberlibs.init(mod)
			if(mod.loaded == true) then
				print(tag.." loaded into CyberScript")
			end 
		else 
			print("ERROR : "..tag.." : CyberScript not found !")
		end
	end
	
end)

function mod.compile()
	return cyberlibs.ImportDataPackFolder()
end

function mod.readFile(path)
	return cyberlibs.readFile(path)
end

function mod.saveFile(path,objm,types)
	cyberlibs.saveFile(path,objm,types)
end

function mod.saveDesc(objm)
	cyberlibs.saveDesc(objm)
end

function mod.deleteFile(path)
	cyberlibs.deleteFile(path)
end
	
return mod