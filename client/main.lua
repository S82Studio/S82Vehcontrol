local isOpen    = false
local inVehicle = false


local function Notify(msg, notifType)
    notifType = notifType or 'inform'
    if Config.NotifyStyle == 'qb' then
        exports['qb-core']:DrawText(msg, 'left')
    elseif Config.NotifyStyle == 'esx' then
        TriggerEvent('esx:showNotification', msg)
    elseif Config.NotifyStyle == 'ox' then
        exports.ox_lib:notify({ title = Config.ScriptName, description = msg, type = notifType })
    else
        BeginTextCommandThefeedPost('STRING')
        AddTextComponentSubstringPlayerName(msg)
        EndTextCommandThefeedPostTicker(false, true)
    end
end

local function IsInVehicle()
    return IsPedInAnyVehicle(PlayerPedId(), false)
end

local function HasPermission()
    if Config.PermissionType == 'none' then return true end
    if Config.PermissionType == 'ace' then
        return IsPlayerAceAllowed(PlayerId(), Config.AceNode)
    end
    return true
end


local function OpenHUD()
    if not HasPermission() then
        Notify('~r~Bạn không có quyền sử dụng chức năng này.', 'error')
        return
    end
    if Config.Features.MediaPlayer and Config.MediaPlayer.InVehicleOnly then
        if not IsInVehicle() then
            Notify('~y~Bạn phải ở trong xe để mở HUD.', 'error')
            return
        end
    end

    isOpen = true
    SetNuiFocus(true, true)

    SendNUIMessage({
        action = 'openHUD',
        theme  = Config.Theme,
        features = Config.Features,
        mediaPlayer = {
            defaultVolume   = Config.MediaPlayer.DefaultVolume,
            allowCustomURLs = Config.MediaPlayer.AllowCustomURLs,
            stations        = Config.MediaPlayer.DefaultStations,
        },
        keybinds     = Config.Keybinds,
    })
end

local function CloseHUD()
    isOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'closeHUD' })
end


RegisterNUICallback('closeHUD', function(_, cb)
    CloseHUD()
    cb('ok')
end)

RegisterNUICallback('toggleEngine', function(data, cb)
    TriggerEvent('s82vehcontrol:client:toggleEngine', data)
    cb('ok')
end)

RegisterNUICallback('toggleWindow', function(data, cb)
    TriggerEvent('s82vehcontrol:client:toggleWindow', data)
    cb('ok')
end)

RegisterNUICallback('toggleDoor', function(data, cb)
    TriggerEvent('s82vehcontrol:client:toggleDoor', data)
    cb('ok')
end)

RegisterNUICallback('seatEject', function(data, cb)
    TriggerEvent('s82vehcontrol:client:seatEject', data)
    cb('ok')
end)

RegisterNUICallback('changeSeat', function(data, cb)
    TriggerEvent('s82vehcontrol:client:changeSeat', data)
    cb('ok')
end)

RegisterNUICallback('requestSeatInfo', function(_, cb)
    TriggerEvent('s82vehcontrol:client:requestSeatInfo')
    cb('ok')
end)


RegisterNUICallback('toggleHazards', function(data, cb)
    TriggerEvent('s82vehcontrol:client:toggleHazards', data)
    cb('ok')
end)

RegisterNUICallback('toggleLights', function(data, cb)
    TriggerEvent('s82vehcontrol:client:toggleLights', data)
    cb('ok')
end)

RegisterNUICallback('toggleIndicator', function(data, cb)
    TriggerEvent('s82vehcontrol:client:toggleIndicator', data)
    cb('ok')
end)




RegisterCommand(Config.Commands.Open, function()
    if isOpen then CloseHUD() else OpenHUD() end
end, false)



local function RegisterKeybind(action, cfg, handler)
    if not cfg.enabled then return end
    RegisterKeyMapping(
        Config.ScriptName .. ':' .. action,
        cfg.label,
        'keyboard',
        cfg.key
    )
    RegisterCommand(Config.ScriptName .. ':' .. action, handler, false)
end

RegisterKeybind('OpenHUD',       Config.Keybinds.OpenHUD,       function() if isOpen then CloseHUD() else OpenHUD() end end)
RegisterKeybind('Engine',        Config.Keybinds.Engine,        function() TriggerEvent('s82vehcontrol:client:toggleEngine',    {}) end)
RegisterKeybind('Hazards',       Config.Keybinds.Hazards,       function() TriggerEvent('s82vehcontrol:client:toggleHazards',   {}) end)
RegisterKeybind('Lights',        Config.Keybinds.Lights,        function() TriggerEvent('s82vehcontrol:client:toggleLights',    {}) end)
RegisterKeybind('IndicatorLeft', Config.Keybinds.IndicatorLeft, function() TriggerEvent('s82vehcontrol:client:toggleIndicator', { side = 'left' }) end)
RegisterKeybind('IndicatorRight',Config.Keybinds.IndicatorRight,function() TriggerEvent('s82vehcontrol:client:toggleIndicator', { side = 'right' }) end)
RegisterKeybind('WindowFL',      Config.Keybinds.WindowFL,      function() TriggerEvent('s82vehcontrol:client:toggleWindow',    { index = 0 }) end)
RegisterKeybind('WindowFR',      Config.Keybinds.WindowFR,      function() TriggerEvent('s82vehcontrol:client:toggleWindow',    { index = 1 }) end)
RegisterKeybind('WindowRL',      Config.Keybinds.WindowRL,      function() TriggerEvent('s82vehcontrol:client:toggleWindow',    { index = 2 }) end)
RegisterKeybind('WindowRR',      Config.Keybinds.WindowRR,      function() TriggerEvent('s82vehcontrol:client:toggleWindow',    { index = 3 }) end)
RegisterKeybind('DoorFL',        Config.Keybinds.DoorFL,        function() TriggerEvent('s82vehcontrol:client:toggleDoor',      { index = 0 }) end)
RegisterKeybind('DoorFR',        Config.Keybinds.DoorFR,        function() TriggerEvent('s82vehcontrol:client:toggleDoor',      { index = 1 }) end)


CreateThread(function()
    while true do
        local wasInVehicle = inVehicle
        inVehicle = IsInVehicle()

        if wasInVehicle and not inVehicle and isOpen then
            if Config.Features.MediaPlayer and Config.MediaPlayer.InVehicleOnly then
                CloseHUD()
            end
        end
        Wait(1000)
    end
end)

if Config.Debug then
    print('[' .. Config.ScriptName .. '] Client main.lua đã tải xong.')
end
