--     _             _                __          _ 
--    | | ___   ___ | | __  _ __    / _| ___  ___| |
--    | |/ _ \ / _ \| |/ / | '_  \ | |_ / _ \/ _ \ |
--    | | (_) | (_) |   <  | | | | |  _|  __/  __/ |
--    |_|\___/ \___/|_|\_\ |_| |_| |_|  \___|\___|_|                                          


local colors = require("colors")


hl.config({
    -- general --
    general = {
        gaps_in = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border = colors.outline,
            inactive_border = colors.outline_variant,
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    
    -- decoration --
    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 0.8,

        shadow = {
            enabled = false,
        },

        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            ignore_opacity = true,
            new_optimizations = true,
            special = false,
            popups = true,
            xray = true,
            vibrancy = 0.1696,
        },
    },
})