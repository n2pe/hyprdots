--      _                      
--     | |__  _   _ _ __  _ __ 
--     | '_ \| | | | '_ \| '__|
--     | | | | |_| | |_) | |   
--     |_| |_|\__, | .__/|_|   
--            |___/|_|         


require("colors")


-- monitors --
hl.monitor({
    output =    "eDP-1",
    mode =      "1920x1080@144.15",
    position =  "0x0",
    scale =     1,
})


-- my programs --
local terminal =    "kitty"
local fileManager = "nautilus"
local menu =        "rofi -show drun"


-- autostart --
hl.on("hyprland.start", function ()
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24") --posy-white 24
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme Posy_Cursor")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")
    hl.exec_cmd("--no-startup-id waybar")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("--no-startup-id 'killall -q waybar; waybar'") --maybe remove?
end)

-- permissions --
hl.config({ ecosystem = { enforce_permissions = true } })

hl.permission({ binary = "/usr/bin/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(bin|local/bin)/hyprpm", type = "plugin", mode = "allow" })


-- layouts --
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})


-- other --
hl.config({
    debug = {
        suppress_errors = false,
        error_limit = 10,
    },
    misc = {
        disable_hyprland_logo = 1,
        force_default_wallpaper = 0,
        vrr = 0,
    },
})


-------------------------------------------
---- FILE PATH MAY NEED TO BE CHANGED -----
-------------------------------------------
-- environment variables --
--require("~/.config/uwsm/env") not needed?


-- tags --
require("configs/tags")


-- look and feel --
require("configs/looknfeel")


-- animations --
require("configs/UserAnimations")


-- window and layer rules --
require("configs/rules")


-- input --
require("configs/input")


-- binds --
require("configs/keybinds")