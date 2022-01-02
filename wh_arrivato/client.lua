local color = {r = 255, g = 255, b = 255, alpha = 255} -- colore della scritta sopra la testa 
local font = 2 -- font per la scritta sopra la testa, puoi scegliere tra {1,2,3,4}
local nbrDisplaying = 1
local firstspawn = 0 -- non cambiarlo


AddEventHandler('playerSpawned', function(spawn)
    if firstspawn == 0 then
    local msg = "~w~Appena Arrivato"
    TriggerServerEvent("framework:shareDisplay", msg, source)
    local color = {r = 255, g = 255, b = 255, alpha = 255}
    firstspawn = 1
    end
end)

    RegisterNetEvent('framework:triggerDisplay')
    AddEventHandler('framework:triggerDisplay', function(text, source)
        local offset = 1 + (nbrDisplaying*0.14)
        Display2(GetPlayerFromServerId(source), text, offset)
    end)

    function Display(mePlayer, text, offset)
        local displaying = true
    
        Citizen.CreateThread(function()
            Wait(15000)
            displaying = false
        end)
    
        Citizen.CreateThread(function()
            nbrDisplaying = nbrDisplaying + 1
            while displaying do
                Wait(0)
                local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
                local coords = GetEntityCoords(PlayerPedId(), false)
                local dist = Vdist2(coordsMe, coords)
                if dist < 500 then
                     DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset-0.014, text)
                end
            end
            nbrDisplaying = nbrDisplaying - 1
        end)
    end




function DrawText3D(x,y,z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextDropshadow(0, 255, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end
