fx_version 'cerulean'
game 'gta5'

author      'S82 Studio'
description 'S82Vehcontrol - HUD dieu khien xe (nhac, kinh, cua, ghe, den)'
version     '1.0.0'

client_scripts {
    'config.lua',
    'client/main.lua',
    'client/controls.lua',
    'client/music.lua',
}

server_scripts {
    'config.lua',
    'server/main.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/style.css',
    'html/css/fontawesome.min.css',
    'html/js/app.js',
    'html/js/music.js',
    'html/fonts/roboto-400.woff2',
    'html/fonts/roboto-600.woff2',
    'html/fonts/roboto-700.woff2',
    'html/webfonts/fa-solid-900.woff2',
    'html/webfonts/fa-brands-400.woff2',
    'html/webfonts/fa-regular-400.woff2',
    'html/webfonts/fa-v4compatibility.woff2',
}

lua54 'yes'
