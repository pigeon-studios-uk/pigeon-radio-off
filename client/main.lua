--[[
    Pigeon Radio Off: client.

    GTA plays the radio the moment someone gets in a car. With Config.StartOff, the radio is switched off
    when the player gets in to drive (and held off for two seconds, while GTA tries to start it with the
    engine), so it only plays when they choose. Vehicles in Config.NoRadioClasses or
    Config.NoRadioVehicles get no radio at all, and stations in Config.HiddenStations are taken off the
    radio wheel everywhere.

    Outside vehicles it only checks twice a second.
]]

local RESOURCE = GetCurrentResourceName()
local IDLE_MS = 500
local HOLD_OFF_MS = 2000        -- how long the radio is held off after getting in to drive
local HOLD_STEP_MS = 250

local noRadioClasses, noRadioVehicles = {}, {}
for _, class in ipairs(Config.NoRadioClasses or {}) do noRadioClasses[tonumber(class)] = true end
for _, name in ipairs(Config.NoRadioVehicles or {}) do noRadioVehicles[joaat(name) & 0xFFFFFFFF] = true end

local silenced = {}             -- vehicles whose radio was disabled, so it can be enabled again

local function noRadio(vehicle)
    return noRadioClasses[GetVehicleClass(vehicle)] or noRadioVehicles[GetEntityModel(vehicle) & 0xFFFFFFFF] or false
end

local function hideStations(hidden)
    for _, station in ipairs(Config.HiddenStations or {}) do LockRadioStation(station, hidden) end
end

CreateThread(function()
    hideStations(true)

    local current, driving, holdUntil = 0, false, 0
    while true do
        local ped = PlayerPedId()
        local vehicle = IsPedInAnyVehicle(ped, false) and GetVehiclePedIsIn(ped, false) or 0
        local now = GetGameTimer()

        if vehicle == 0 then
            current, driving = 0, false
            Wait(IDLE_MS)
        else
            local isDriver = GetPedInVehicleSeat(vehicle, -1) == ped

            if vehicle ~= current then
                current = vehicle
                if noRadio(vehicle) then
                    SetVehicleRadioEnabled(vehicle, false)
                    SetVehRadioStation(vehicle, 'OFF')
                    silenced[vehicle] = true
                end
            end

            -- Getting in to drive, or moving into the driver's seat.
            if isDriver and not driving and Config.StartOff then holdUntil = now + HOLD_OFF_MS end
            driving = isDriver

            if now < holdUntil then
                SetVehRadioStation(vehicle, 'OFF')
                Wait(HOLD_STEP_MS)
            else
                Wait(IDLE_MS)
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= RESOURCE then return end
    hideStations(false)
    for vehicle in pairs(silenced) do
        if DoesEntityExist(vehicle) then SetVehicleRadioEnabled(vehicle, true) end
    end
end)
