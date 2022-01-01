RegisterServerEvent('framework:shareDisplay2')
AddEventHandler('framework:shareDisplay2', function(text)
    TriggerClientEvent('framework:triggerDisplay2', -1, text, source)
end)

