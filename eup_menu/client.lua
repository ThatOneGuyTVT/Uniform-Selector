local currentOutfit = nil
local isMenuOpen = false

-- Open EUP Menu
function OpenEUPMenu()
    if isMenuOpen then return end
    
    local elements = {}
    
    for k, v in pairs(Config.Uniforms) do
        table.insert(elements, {label = v.label, value = k})
    end
    
    table.insert(elements, {label = 'Remove Uniform', value = 'remove'})
    
    SendNUIMessage({
        type = 'openMenu',
        uniforms = elements
    })
    
    SetNuiFocus(true, true)
    isMenuOpen = true
end

-- Apply uniform
function ApplyUniform(uniformName)
    local playerPed = PlayerPedId()
    local uniform = Config.Uniforms[uniformName]
    
    if not uniform then 
        print('[EUP] Error: Uniform not found - ' .. tostring(uniformName))
        return 
    end
    
    -- Check if male or female
    local model = GetEntityModel(playerPed)
    local isMale = (model == GetHashKey('mp_m_freemode_01'))
    
    local outfit = isMale and uniform.male or uniform.female
    
    if not outfit then
        print('[EUP] Error: Outfit data not found for ' .. tostring(uniformName))
        return
    end
    
    -- Apply each clothing component
    if outfit['tshirt_1'] then
        SetPedComponentVariation(playerPed, 8, outfit['tshirt_1'], outfit['tshirt_2'] or 0, 0)
    end
    
    if outfit['torso_1'] then
        SetPedComponentVariation(playerPed, 11, outfit['torso_1'], outfit['torso_2'] or 0, 0)
    end
    
    if outfit['decals_1'] then
        SetPedComponentVariation(playerPed, 10, outfit['decals_1'], outfit['decals_2'] or 0, 0)
    end
    
    if outfit['arms'] then
        SetPedComponentVariation(playerPed, 3, outfit['arms'], 0, 0)
    end
    
    if outfit['pants_1'] then
        SetPedComponentVariation(playerPed, 4, outfit['pants_1'], outfit['pants_2'] or 0, 0)
    end
    
    if outfit['shoes_1'] then
        SetPedComponentVariation(playerPed, 6, outfit['shoes_1'], outfit['shoes_2'] or 0, 0)
    end
    
    if outfit['helmet_1'] and outfit['helmet_1'] ~= -1 then
        SetPedPropIndex(playerPed, 0, outfit['helmet_1'], outfit['helmet_2'] or 0, true)
    else
        ClearPedProp(playerPed, 0)
    end
    
    if outfit['chain_1'] then
        SetPedComponentVariation(playerPed, 7, outfit['chain_1'], outfit['chain_2'] or 0, 0)
    end
    
    if outfit['ears_1'] and outfit['ears_1'] ~= -1 then
        SetPedPropIndex(playerPed, 2, outfit['ears_1'], outfit['ears_2'] or 0, true)
    else
        ClearPedProp(playerPed, 2)
    end
    
    currentOutfit = uniformName
    
    -- Notification
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {'[EUP]', 'Uniform applied: ' .. uniform.label}
    })
end

-- Remove uniform (resets to default MP ped)
function RemoveUniform()
    local playerPed = PlayerPedId()
    local model = GetEntityModel(playerPed)
    
    -- Reset to default freemode clothing
    if model == GetHashKey('mp_m_freemode_01') then
        -- Male defaults
        SetPedComponentVariation(playerPed, 8, 15, 0, 0) -- Undershirt
        SetPedComponentVariation(playerPed, 11, 15, 0, 0) -- Torso
        SetPedComponentVariation(playerPed, 3, 15, 0, 0) -- Arms
        SetPedComponentVariation(playerPed, 4, 14, 0, 0) -- Pants
        SetPedComponentVariation(playerPed, 6, 34, 0, 0) -- Shoes
    else
        -- Female defaults
        SetPedComponentVariation(playerPed, 8, 15, 0, 0)
        SetPedComponentVariation(playerPed, 11, 15, 0, 0)
        SetPedComponentVariation(playerPed, 3, 15, 0, 0)
        SetPedComponentVariation(playerPed, 4, 14, 0, 0)
        SetPedComponentVariation(playerPed, 6, 35, 0, 0)
    end
    
    -- Clear props
    ClearPedProp(playerPed, 0) -- Hat
    ClearPedProp(playerPed, 2) -- Ears
    
    currentOutfit = nil
    
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {'[EUP]', 'Uniform removed'}
    })
end

-- NUI Callbacks
RegisterNUICallback('selectUniform', function(data, cb)
    SetNuiFocus(false, false)
    isMenuOpen = false
    
    if data.uniform == 'remove' then
        RemoveUniform()
    else
        ApplyUniform(data.uniform)
    end
    
    cb('ok')
end)

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    isMenuOpen = false
    cb('ok')
end)

-- Close menu with ESC
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isMenuOpen then
            if IsControlJustPressed(0, 322) or IsControlJustPressed(0, 177) then -- ESC or Backspace
                SetNuiFocus(false, false)
                isMenuOpen = false
                SendNUIMessage({
                    type = 'closeMenu'
                })
            end
        else
            Citizen.Wait(500)
        end
    end
end)

-- Command
RegisterCommand('eup', function(source, args, rawCommand)
    OpenEUPMenu()
end, false)

-- Alternative command
RegisterCommand('uniform', function(source, args, rawCommand)
    OpenEUPMenu()
end, false)
