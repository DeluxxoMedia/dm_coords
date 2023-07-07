RegisterCommand('coords3', function(source, args, rawCommand)   ----- To vector2 in format x,y,z
	local coords = GetEntityCoords(PlayerPedId())
	SendNUIMessage({
		coords = ""..coords.x..","..coords.y..","..coords.z..""
	})
end)

RegisterCommand('heading', function(source, args, rawCommand)  ------ To Heading 
	local heading = GetEntityHeading(PlayerPedId())
	SendNUIMessage({
		coords = ""..heading..""
	})
end)

RegisterCommand('coords4', function(source, args, rawCommand) ------ To vector4 in format x,y,z,h
	local coords = GetEntityCoords(PlayerPedId())
	local heading = GetEntityHeading(PlayerPedId())
	SendNUIMessage({
		coords = ""..coords.x..","..coords.y..","..coords.z..","..heading..""
	})
end)

RegisterCommand('tpc', function(source, args, rawCommand)
	local coords = {}
	for coord in string.gmatch(args[1] or "0,0,0","[^,]+") do
		table.insert(coords,tonumber(coord))
	end

	local x, y, z = 0,0,0
	if coords[1] ~= nil then x = coords[1] end
	if coords[2] ~= nil then y = coords[2] end
	if coords[3] ~= nil then z = coords[3] end

	SetEntityCoords(GetPlayerPed(-1), x,y,z, false)
end)
