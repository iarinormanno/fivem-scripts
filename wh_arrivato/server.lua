RegisterServerEvent('framework:shareDisplay')
AddEventHandler('framework:shareDisplay', function(text)
    TriggerClientEvent('framework:triggerDisplay', -1, text, source)
end)

