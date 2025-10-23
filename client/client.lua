RegisterNetEvent('naufal-warhorn:client:PlayHorn')
AddEventHandler('naufal-warhorn:client:PlayHorn', function(region)
    local ped = PlayerPedId()
    local entity = NetworkGetNetworkIdFromEntity(ped)
    local pos = GetEntityCoords(NetworkGetEntityFromNetworkId(entity))
    local radius = 1000

    TriggerServerEvent('naufal-warhorn:server:PlayHorn', pos, radius, region)
end)