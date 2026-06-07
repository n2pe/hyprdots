--     _              _     _           _     
--    | | _____ _   _| |__ (_)_ __   __| |___ 
--    | |/ / _ \ | | | '_ \| | '_ \ / _` / __|
--    |   <  __/ |_| | |_) | | | | | (_| \__ \
--    |_|\_\___|\__, |_.__/|_|_| |_|\__,_|___/
--              |___/                         


local terminal =    "kitty"
local fileManager = "nautilus"
local menu =        "rofi -show drun"

local mainMod = "SUPER"

-- open things --
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q ", hl.dsp.window.close(active))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(fileManager))


-- does things --
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("swapsplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen({ mode = "fullscreen" }))


-- scripts --
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("/home/nipe/.config/hypr/scripts/wppicker.sh"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("/home/nipe/.config/hypr/scripts/WaybarStyles.sh"))
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd("/home/nipe/.config/hypr/scripts/WaybarLayout.sh"))


-- unused --
-- hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd([float; size 800 550] terminal))
-- hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("hyprpicker -a"))
-- hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
-- hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
-- hl.bind(mainMod .. " + CRTL + ALT + DELETE", hl.dsp.exec_cmd("hyprctl dispatch exit 0"))


-- Move focus with mainMod + arrow keys --
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))


-- move windows --
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.move({ direction = "down" }))


-- resize windows --
hl.bind("CTRL + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind("CTRL + left",  hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind("CTRL + up",    hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
hl.bind("CTRL + down",  hl.dsp.window.resize({ x = 0, y = 50, relative = true }))


-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))


-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 10%+"),                 { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 10%-"),                 { locked = true, repeating = true })


-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })