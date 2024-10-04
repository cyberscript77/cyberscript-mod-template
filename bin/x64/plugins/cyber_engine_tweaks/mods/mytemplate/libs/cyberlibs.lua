local libs_version = "1.0"

local cyberlibs = {}

local cyberscript = nil


function dump(o)
	if type(o) == 'table' then
		local s = '{ '
		for k,v in pairs(o) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			s = s .. '['..k..'] = ' .. dump(v) .. ','
		end
		return s .. '} '
		else
		return tostring(o)
	end
end

function catch(what)
	return what[1]
end

function try(what)
	status, result = pcall(what[1])
	if not status then
		what[2](result)
	end
	return result
end

function trydecodeJSOn(text, file,path)
	local jsontext = nil
	if(path == nil) then
		path = "Unknown"
	end
	try {
		function()
			jsontext = json.decode(text)
			
		end,
		catch {
			function(error)
				
				logme(1,'Error decoding JSON : '..error.." ( path : "..path,true)
				file:close()
			end
		}
	}
	return jsontext
end

function cyberlibs.init(mod)
	
	local path = "desc.json"
	local flo = io.open(path)
	local lines = flo:read("*a")
	local jsonf = trydecodeJSOn(lines,flo,path)
	flo:close()
	tag = jsonf.tag

	if GetMod('cyberscript') then 
		cyberscript =  GetMod("cyberscript")
		if(cyberscript.datapackRegistry == nil) then
			cyberscript.datapackRegistry = {}
		end
		
		table.insert(cyberscript.datapackRegistry,tag)
		print(tag.." loaded into CyberScript")
	else 
		print("ERROR : "..tag.." : CyberScript not found !")
			
	end
	
	
	
end

function cyberlibs.ImportDataPackFolder()
	
	local path = "desc.json"
	local flo = io.open(path)
	local lines = flo:read("*a")
	local jsonf = trydecodeJSOn(lines,flo,path)
	flo:close()
	tag = jsonf.tag
	local datapack = {}

	datapack = {}
	datapack.metadata=jsonf
	
	datapack.cachedata={}
	
	
	
	
		try {
			function()
				loadDatapackObject(datapack,tag)
				
				
				
			end,
			catch {
				function(error)
					
					datapack = nil
				end
			}
		}
	
	return datapack
	

end

function cyberlibs.saveFile(path,objm,types)

	local reader = dir("datapack/"..types)
				
	if(reader == nil) then
		
		print(tag.." Error :  the folder "..types.."do not exist !")
		spdlog.error(tag.." Error :  the folder "..types.."do not exist !")
			
			
	else
			
			local file = assert(io.open(path, "w"))
			local stringg = JSON:encode_pretty(objm)
			file:write(stringg)
			file:close()
			
	end




end


function cyberlibs.saveDesc(objm)

	
			local file = assert(io.open("desc.json", "w"))
			local stringg = JSON:encode_pretty(objm)
			file:write(stringg)
			file:close()
			
	




end

function cyberlibs.readFile(path)

	local foo = io.open(path)
	local lines = foo:read("*a")
	local jsonf = nil
	if(lines ~= "") then
		jsonf = trydecodeJSOn(lines,foo,path)
	else
		res = false
		
	end
	foo:close()
	return jsonf
end

function cyberlibs.deleteFile(path)

	os.remove(path)

end

function loadDatapackObject(datapack,tag)

	local namespace = tag
	
	datapack.enabled = false
	
	
	
	for i=1,#cyberscript.datapackObjectType do
		local objtype = cyberscript.datapackObjectType[i]
		
		local reader = dir("datapack/"..objtype)
		if(reader ~= nil) then
			datapack[objtype] = {}
			for i=1, #reader do 
				if(objtype == "texture") then
					
					if(tostring(reader[i].type) == "file" and 
						(
							string.match(tostring(reader[i].name), ".jpg") or 
							string.match(tostring(reader[i].name), ".jpeg") or 
							string.match(tostring(reader[i].name), ".png")or 
							string.match(tostring(reader[i].name), ".bmp")
						)
					) then
					
					local imageobj = {}
					
					
					imageobj.name = reader[i].name
					imageobj.path="datapack/"..objtype.."/"..reader[i].name
					imageobj.file="datapack/"..objtype.."/"..reader[i].name
					imageobj.namespace = namespace
					
					
					
					datapack[objtype][tostring(reader[i].name)] = {}
					datapack[objtype][tostring(reader[i].name)] = imageobj
					
					end
					
					
					
					else
					
					if(tostring(reader[i].type) == "file" and string.match(tostring(reader[i].name), ".json")) then
						
						local foo = io.open("datapack/"..objtype.."/"..reader[i].name)
						local lines = foo:read("*a")
						if(lines ~= "") then
							local jsonf = trydecodeJSOn(lines,foo,"datapack/"..objtype.."/"..reader[i].name)
							datapack[objtype][tostring(reader[i].name)] = {}
							datapack[objtype][tostring(reader[i].name)] = jsonf
							
							else
							res = false
							
						end
								foo:close()
					end
					
					
					
				end
			end
		end
	end
end


return cyberlibs