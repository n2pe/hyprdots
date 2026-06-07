--               _           _                            _           
--    __      _(_)_ __   __| | _____      __  _ __ _   _| | ___  ___ 
--    \ \ /\ / / | '_ \ / _` |/ _ \ \ /\ / / | '__| | | | |/ _ \/ __|
--     \ V  V /| | | | | (_| | (_) \ V  V /  | |  | |_| | |  __/\__ \
--      \_/\_/ |_|_| |_|\__,_|\___/ \_/\_/   |_|   \__,_|_|\___||___/  


-- opacity --
hl.window_rule({ match = { tag =   "multimedia_video"  }, opacity = "1.0" })
hl.window_rule({ match = { class = "org.gnome.Nautilus" }, opacity = "0.8" })
hl.window_rule({ match = { class = "kitty|org.pulseaudio.pavucontrol" }, opacity = "0.9" })
hl.window_rule({ match = { class = "zen|app.zen_browser.zen"          }, opacity = "0.9 override 0.7 override 1 override" })
hl.window_rule({ match = { class = "vesktop|code|google-chrome|steam|org.DolphinEmu.dolphin-emu" }, opacity = "0.85 override 0.7 override 1 override" })
hl.window_rule({ match = { class = "Spotify" }, opacity = "0.8 override 0.6 override 1 override" })


-- floating, center, size  --
hl.window_rule({ match = { tag =   "multimedia_video"},          float = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol"}, float = true })
hl.window_rule({ match = { tag =   "multimedia_video"},          size = {900, 506} })
hl.window_rule({ match = { tag =   "multimedia_video"},          center = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol"}, center = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol"}, size = {"(monitor_w*0.5)", "(monitor_h*0.5)"} })


-- pop ups --
hl.window_rule({ match = { title = "Save As|Save a File|Pick Files"}, float = true, size = {"(monitor_w*0.5)", "(monitor_h*0.5)"} })
hl.window_rule({ match = { initial_title = "Open Files"}, float = true, size = {"(monitor_w*0.5)", "(monitor_h*0.5)"} })


-- misc --
local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})


hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})


--      _                                    _           
--     | | __ _ _   _  ___ _ __   _ __ _   _| | ___  ___ 
--     | |/ _` | | | |/ _ \ '__| | '__| | | | |/ _ \/ __|
--     | | (_| | |_| |  __/ |    | |  | |_| | |  __/\__ \
--     |_|\__,_|\__, |\___|_|    |_|   \__,_|_|\___||___/
--              |___/                                    


-- waybar --

hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "waybar" }, ignore_alpha = 0  })


-- wlogout --
hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })
hl.layer_rule({ match = { namespace = "logout_dialog" }, xray = true })


-- swaync --
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, ignore_alpha = 0 })


-- misc --
hl.layer_rule({ match = { namespace = "selection" }, no_anim = true, ignore_alpha = 0 })