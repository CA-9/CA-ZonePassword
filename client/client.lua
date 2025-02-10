local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    for _, zone in ipairs(Cadev.Zones) do
        local createdZone = CircleZone:Create(zone.coords, zone.radius, {
            name = zone.name,
            useZ = zone.useZ,
            debugPoly = zone.debugPoly
        })
        createdZone:onPlayerInOut(function(isInside)
            if isInside then
                print("Entered zone: " .. zone.name)
                if zone.requiresPassword then
                    local input = lib.inputDialog('Enter Password', {
                        { type = 'input', label = 'Password', password = true },
                    })

                    if input and input[1] and tostring(input[1]) == tostring(zone.password) then
                        TriggerEvent(zone.event)
                        QBCore.Functions.Notify('Correct password', 'success')
                    else
                        QBCore.Functions.Notify('Incorrect password', 'error')
                    end
                else
                    TriggerEvent(zone.event)
                end
            else
                print("Exited zone: " .. zone.name)
            end
        end)
    end
end)

Citizen.CreateThread(function()
    for _, location in ipairs(Cadev.Locations) do
        exports.interact:AddInteraction({
            coords = location.coords,
            distance = location.distance,
            interactDst = location.interactDst,
            id = location.id,
            name = location.name,
            options = {
                {
                    label = location.uitext,
                    event = "CA-Pass",
                    args = location.id
                },
            }
        })
    end
end)

RegisterNetEvent('CA-Pass', function(data)
    if not data then
        QBCore.Functions.Notify('Invalid Location', 'error')
        return
    end

    local locationId = data.args

    local locationData = nil

    for _, location in ipairs(Cadev.Locations) do
        if tostring(location.id) == tostring(locationId) then
            locationData = location
            break
        end
    end

    if not locationData then
        QBCore.Functions.Notify('Invalid Location', 'error')
        return
    end
    if locationData.requiresPassword then
    local input = lib.inputDialog('Enter Password', {
        { type = 'input', label = 'Password', description = '', icon = 'hashtag', password = true },
    })
if input and input[1] and tostring(input[1]) == tostring(locationData.password) then
    TriggerEvent(locationData.event)
    QBCore.Functions.Notify('Correct password', 'success')
else
    QBCore.Functions.Notify('You have entered the wrong password', 'error')
end
end
TriggerEvent(locationData.event)
end)

RegisterNetEvent("CA-ALERT", function()
    local alert = lib.alertDialog({
        header = 'Heli Garage',
        content = 'You have opened the garage menu successfully!',
        centered = true,
        cancel = true
    })

    if alert == "confirm" then
        TriggerEvent("qb-heli:client:openMenu")
    end
end)
