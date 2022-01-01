fx_version 'cerulean'
games { 'gta5' }

author 'Iari Normanno aka who$y '
description 'Esce la scritta "Appena Arrivato" sulla testa appena un player si connette'
version '1.0.0'


client_script 'client.lua'
server_script {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}
