-- Server-side permission checks (optional)
RegisterServerEvent('eup:checkPermission')
AddEventHandler('eup:checkPermission', function(uniform)
    local src = source
    
    if not Config.UsePermissions then
        -- Permissions disabled, allow all
        return
    end
    
    -- Add your framework's permission check here
    -- Example for ESX:
    -- local xPlayer = ESX.GetPlayerFromId(src)
    -- if xPlayer.job.name == Config.Permissions[uniform] then
    --     TriggerClientEvent('eup:allowUniform', src, uniform)
    -- end
    
    -- Example for QBCore:
    -- local Player = QBCore.Functions.GetPlayer(src)
    -- if Player.PlayerData.job.name == Config.Permissions[uniform] then
    --     TriggerClientEvent('eup:allowUniform', src, uniform)
    -- end
end)

-- Log when players use uniforms (optional)
RegisterServerEvent('eup:logUniformChange')
AddEventHandler('eup:logUniformChange', function(uniform)
    local src = source
    local playerName = GetPlayerName(src)
    print('[EUP] ' .. playerName .. ' (ID: ' .. src .. ') changed to uniform: ' .. uniform)
end)
