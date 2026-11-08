fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'pigeon-radio-off'
author 'Pigeon Studios'
description 'Vehicles start with the radio off, some vehicles have no radio at all, and stations you choose are taken off the wheel.'
version '0.1.0'
repository 'https://github.com/pigeon-studios-uk/pigeon-radio-off'

-- Pigeon Studios version registry entry, read by server/version_check.lua.
pigeon_slug 'pigeon-radio-off'

client_scripts {
    'configuration/config.lua',
    'client/main.lua',
}

server_scripts {
    'server/version_check.lua',
}
