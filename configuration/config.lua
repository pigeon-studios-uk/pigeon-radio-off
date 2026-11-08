Config = {}

-- Switch the radio off when a player gets in to drive, so it only plays when they turn it on. GTA switches
-- it on as the engine starts, so it's held off for the first two seconds after getting in.
Config.StartOff = true

-- Vehicle classes with no radio at all, in any seat. Use {} for none.
-- 18 emergency · 19 military · 15 helicopters · 16 planes · 14 boats
-- The full list: https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.NoRadioClasses = {
    -- 18,
}

-- Vehicles with no radio at all, by spawn name (the name you'd use to spawn it). Use {} for none.
Config.NoRadioVehicles = {
    -- 'police',
    -- 'ambulance',
}

-- Stations taken off the radio wheel for everyone, so they're never heard, in vehicles or anywhere else.
-- Use their internal names: https://docs.fivem.net/docs/game-references/radiostations/
-- For example 'RADIO_05_TALK_01' (West Coast Talk Radio). Use {} for none.
Config.HiddenStations = {
    -- 'RADIO_05_TALK_01',
    -- 'RADIO_11_TALK_02',
}

-- Update checks are controlled in server.cfg for every Pigeon Studios resource at once:
--     set pigeon_update_check "on"      (default)  |  "quiet"  |  "off"
