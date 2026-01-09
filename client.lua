local currentFormat = 3 -- Par défaut X, Y, Z

RegisterCommand('setc2', function()
    currentFormat = 2
    print("Format défini sur 2 paramètres (X, Y)")
end)

RegisterCommand('setc3', function()
    currentFormat = 3
    print("Format défini sur 3 paramètres (X, Y, Z)")
end)

RegisterCommand('setc4', function()
    currentFormat = 4
    print("Format défini sur 4 paramètres (X, Y, Z, H)")
end)

local function CopyPlayerCoords()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local result = ""

    if currentFormat == 2 then
        result = string.format("%.2f, %.2f", coords.x, coords.y)
    elseif currentFormat == 3 then
        result = string.format("%.2f, %.2f, %.2f", coords.x, coords.y, coords.z)
    elseif currentFormat == 4 then
        result = string.format("%.2f, %.2f, %.2f, %.2f", coords.x, coords.y, coords.z, heading)
    end

    SendNUIMessage({
        action = "copy",
        text = result
    })
    
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("~g~Coordonnées copiées : ~s~" .. result)
    EndTextCommandThefeedPostTicker(false, true)
end


RegisterKeyMapping('copycoords', 'Copier les coordonnées (Sonorya)', 'keyboard', 'C')

RegisterCommand('copycoords', function()
    if IsControlPressed(0, 36) then 
        CopyPlayerCoords()
    end
end)