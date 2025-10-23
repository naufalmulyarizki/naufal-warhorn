local RSGCore = exports['rsg-core']:GetCoreObject()

local str = tostring
local num = tonumber
local xSound = exports.xsound

RSGCore.Functions.CreateUseableItem("warhorn", function(source)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if not Player then return end

    local job = Player.PlayerData.job.name

    TriggerClientEvent('naufal-warhorn:client:PlayHorn', src, job)
end)

RegisterNetEvent('naufal-warhorn:server:PlayHorn', function(coords, radius, job)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if not Player then return end

    for i = 1, #Config.Warhorns do
        local horns = Config.Warhorns[i]
        local hornname = horns.name

        if job == hornname then
            local name = horns.name
            local url = horns.url

            xSound:PlayUrlPos(-1, tostring(name), url, 0.0, coords)

            Wait(1000)

            xSound:PlayUrlPos(-1, tostring(name), url, 0.5, coords)
            xSound:Distance(-1, tostring(name), radius)

            break
        end
    end
end)