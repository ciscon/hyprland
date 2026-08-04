--#apt install alacritty hyprland-guiutils fonts-font-awesome fonts-roboto waybar xdg-desktop-portal-hyprland

--###############

--## MONITORS ###

--###############

-- See https://wiki.hyprland.org/Configuring/Monitors/

--monitor=,highrr,auto,1
--monitor=,1920x1080@60,auto,auto
--monitor=,1920x1080@144,auto,auto
--monitor = DP-1, 1920x1080@144, 0x0, 1
--monitor=,modeline 274.29 1920 1928 1960 2000 1080 1130 1138 1144 +hsync -vsync,auto,auto #actual 119.880 (ntsc) reduced blanking
--monitor=,modeline 369.00 1920 2080 2288 2656 1080 1083 1088 1160 -hsync +vsync,auto,auto #actual 119.880 (ntsc)
--monitor=,modeline 274.56 1920 1928 1960 2000 1080 1130 1138 1144 +hsync -vsync,auto,auto #actual 120.0 cvt 1.2
--monitor=,modeline 285.50 1920 1968 2000 2080 1080 1083 1088 1144 +hsync -vsync,auto,auto #actual 120.0 cvt 1.1
--monitor=,modeline 370.00 1920 2080 2288 2656 1080 1083 1088 1160 -hsync +vsync,auto,auto #120.198 (nes) (artifacts)
--monitor=,modeline 286.00 1920 1968 2000 2080 1080 1083 1088 1144 +hsync -vsync,auto,auto #120.198 (nes) reduced blanking 1.1
--monitor=,modeline 275.01 1920 1928 1960 2000 1080 1130 1138 1144 +hsync -vsync,auto,auto #120.198 (nes) reduced blanking 1.2

hl.monitor({
  output   = "DP-1",
  mode     = "highrr",
  position = "auto",
  scale    = "auto",
})


--##################

--## MY PROGRAMS ###

--##################

-- See https://wiki.hyprland.org/Configuring/Keywords/

-- Set programs that you use

local terminal = "alacritty msg create-window || exec alacritty"

local browser = browser

local fileManager = "dolphin"

local menu = "dmenu_run -b"

--needs slurp grim wl-clipboard

--$screenshot =  slurp | grim -g - - | wl-copy 

--flameshot

local screenshot = "flameshot gui"


--####################

--## LOOK AND FEEL ###

--####################

-- Refer to https://wiki.hyprland.org/Configuring/Variables/

-- https://wiki.hyprland.org/Configuring/Variables/#general

hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 4,
    border_size = 2,
    -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    -- Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = false,
    -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = true,
    layout = "master",
    col = {
      active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
  },
  render = {
    direct_scanout = 2
  },
  master = {
    mfact = 0.5,
    new_status = "slave",
  },
  decoration = {
    rounding = 2,
    -- Change transparency of focused and unfocused windows
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    -- https://wiki.hyprland.org/Configuring/Variables/#blur
    blur = {
      enabled = false,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },
  animations = {
    enabled = false,
    -- Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
  },

  master = {
    new_status = "master",
  },
  misc = {
    force_default_wallpaper = -1,
    -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = true,
    -- If true disables the random hyprland logo / anime girl background. :(
    -- focus_on_activate = false,
    disable_splash_rendering = true,
    --do not switch workspaces when starting programs
    --vfr = true
    vrr = false
  },
  input = {
    kb_layout = "us",
    -- kb_variant = {  },
    -- kb_model = {  },
    --kb_options = caps:none, altwin:swap_alt_win
    -- kb_rules = {  },
    follow_mouse = 1,
    touchpad = {
      natural_scroll = false,
    },
    accel_profile = "flat",
    sensitivity = -0.75,
  },

})

-- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

--###################

--## KEYBINDINGSS ###

--###################

-- See https://wiki.hyprland.org/Configuring/Keywords/

--$mainMod = Mod1

local mainMod = "SUPER"

-- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

hl.bind(mainMod .. " + " .. "RETURN", hl.dsp.exec_cmd("alacritty msg create-window || exec alacritty"))

hl.bind(mainMod .. " + " .. "G", hl.dsp.exec_cmd("browser"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "G", hl.dsp.exec_cmd("browser -incognito"))

hl.bind(mainMod .. " + " .. "S", hl.dsp.exec_cmd("flameshot gui"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "C", hl.dsp.window.close())

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "Q", hl.dsp.exit())

--bind = $mainMod, E, exec, $fileManager

hl.bind(mainMod .. " + " .. "F", hl.dsp.window.float())

hl.bind(mainMod .. " + " .. "P", hl.dsp.exec_cmd("dmenu_run -b"))

--##windows

--doesn't work properly with master layout after window reordering

--bind = $mainMod, J, cyclenext

--bind = $mainMod, K, cyclenext,prev

--master

hl.bind(mainMod .. " + " .. "J", hl.dsp.layout("cyclenext"))

hl.bind(mainMod .. " + " .. "K", hl.dsp.layout("cycleprev"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "J", hl.dsp.layout("swapnext"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "K", hl.dsp.layout("swapprev"))

--scrolling
-- hl.bind(mainMod .. " + " .. "J", hl.dsp.layout("focus left"))
-- hl.bind(mainMod .. " + " .. "K", hl.dsp.layout("focus right"))
-- hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "J", hl.dsp.layout("swapcol l"))
-- hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "K", hl.dsp.layout("swapcol r"))
-- Move/resize windows with mainMod + LMB/RMB and dragging

hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

--bind = $mainMod, L, resizeactive, 100 0

--bind = $mainMod, H, resizeactive, -100 0

hl.bind(mainMod .. " + " .. "L", hl.dsp.layout("mfact +0.1"))

hl.bind(mainMod .. " + " .. "H", hl.dsp.layout("mfact -0.1"))

hl.bind(mainMod .. " + " .. "i", hl.dsp.layout("addmaster"))

hl.bind(mainMod .. " + " .. "d", hl.dsp.layout("removemaster"))

--##workspaces

-- Loop to generate silent move bindings for workspaces 1 through 10
for i = 1, 10 do
    local ws = i % 10 -- Maps 10 to 0 for the keyboard layout
    hl.bind(
        mainMod .. " + SHIFT + " .. ws, 
        hl.dsp.window.move({ workspace = i, follow = false })
    )
end
-- Loop to generate active move bindings for workspaces 1 through 10
for i = 1, 10 do
    local ws = i % 10 -- Maps 10 to 0 for the keyboard layout
    hl.bind(
        mainMod .. " + SHIFT + CONTROL + " .. ws, 
        hl.dsp.window.move({ workspace = i, follow = false })
    )
end
-- Loop to generate move for workspaces 1 through 10
for i = 1, 10 do
    local ws = i % 10 -- Maps 10 to 0 for the keyboard layout
    hl.bind(
        mainMod .. " + " .. ws, 
        hl.dsp.focus({ workspace = i })
    )
end


hl.bind(mainMod .. " + " .. "M", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Toggle Fullscreen" })


--reset workspace

hl.bind(mainMod .. " + " .. "R", hl.dsp.exec_cmd("hyprctl keyword general:layout master"))
hl.bind(mainMod .. " + " .. "R", hl.dsp.layout("focusmaster master"))
hl.bind(mainMod .. " + " .. "R", hl.dsp.layout("mfact exact .5"))
-- unfloat all windows
hl.bind(mainMod .. " + " .. "R", function ()
  local workspace = hl.get_active_workspace()
  if workspace == nil then return end

  local windows = hl.get_workspace_windows(workspace)
  for _, window in ipairs(windows) do
    hl.dispatch(hl.dsp.window.float({ window = window, action = "off" }))
  end
end)

--##for some reason this crashes hyprland by running repeatedly

--bind = $mainMod, R, togglefloating,

--set back to normal tiling

hl.bind(mainMod .. " + " .. "T", hl.dsp.layout("orientationleft"))

--set to bottom tiling

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "T", hl.dsp.layout("orientationbottom"))

--#dwindle

--bind = $mainMod CONTROL, T, exec, hyprctl keyword general:layout dwindle

--bind = $mainMod, D, pseudo, # dwindle

--bind = $mainMod, J, togglesplit, # dwindle

--bind = $mainMod CONTROL, T, layoutmsg, preserve_split true

hl.bind(mainMod .. " + " .. "space", hl.dsp.exec_cmd("hyprctl keyword general:layout $(hyprctl getoption general:layout | grep -q 'scrolling' && echo 'master' || echo 'scrolling')"))

--! @description: "Toggle between scrolling and master layout"; @windows;

-- Example special workspace (scratchpad)

--bind = $mainMod, S, togglespecialworkspace, magic

--bind = $mainMod SHIFT, S, movetoworkspace, special:magic
-- Scroll through existing workspaces with mainMod + scroll

hl.bind(mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "L", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "H", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + " .. "CONTROL" .. " + " .. "L", hl.dsp.focus({ workspace = "+1" }))

hl.bind(mainMod .. " + " .. "CONTROL" .. " + " .. "H", hl.dsp.focus({ workspace = -1 }))

--switch between two workspaces

hl.config({
  binds = {
    allow_workspace_cycles = true,
  },
})

hl.bind(mainMod .. " + " .. "TAB", hl.dsp.focus({ workspace = "previous" }))

--#############################

--## WINDOWS AND WORKSPACES ###

--#############################

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

-- See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

-- Example windowrule v1

-- windowrule = float, ^(kitty)$

--disable vsync and enable direct scanout for games
local immediate_apps = { 
  '[Xx][Tt]erm',
  '.*[Qq]uake.*',
  '.*zdoom.*',
  '[Ss]team.*',
  '.*[Ss]nes9x.*',
  '[Mm]mame.*',
  '.*[Ss]team.*'
}
local regex_pattern = "^(" .. table.concat(immediate_apps, "|") .. ")$"
hl.window_rule({
  name  = "immediatemode",
  match = {
    class = regex_pattern
  },
  immediate = true,
  fullscreen = true,
  content = "game"
})

-- hl.window_rule({
--     name  = "match_class___xephyr",
--     match = {
--         class = "maximize 1",
--     },
--     -- TODO: review rule: "match:class ^(Xephyr)$"
-- })

hl.window_rule({
  name  = "match_title_____cssh",
  match = {
    title = "^(.*CSSH.*)$",
    title = "^(annotate_toolbar)$",
    class = "^(zoom)$"
  },
  no_initial_focus = true
})

hl.window_rule({
  name  = "workspace_5_silent",
  match = {
    class = "^([Ss]team)$",
  },
  workspace = "5 silent",
})

hl.window_rule({
  name  = "workspace_6_silent",
  match = {
    class = "^(.*Slack)$",
  },
  workspace = "6 silent",
})

hl.window_rule({
  name  = "workspace_7_silent",
  match = {
    class = "^(.*discord.*)$",
  },
  workspace = "7 silent",
})

hl.window_rule({
  name  = "workspace_8_silent",
  match = {
    class = "^(Hexchat)$",
  },
  workspace = "8 silent",
})

hl.window_rule({
  name  = "workspace_9_silent",
  match = {
    class = "^(chrome-music.*)$",
  },
  workspace = "9 silent",
})

--no_gaps_when_only client

hl.workspace_rule({
  workspace = "w[t1]",
  gaps_out = 0,
  gaps_in = 0,
  border_size = 0,
  -- rounding = false,
})

hl.workspace_rule({
  workspace = "f[1]",
  gaps_out = 0,
  gaps_in = 0,
  border_size = 0,
  -- rounding = false,
})

--environment
hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("SDL_AUDIODRIVER", "pipewire")
--##flatpak qt applications don't always have this backend
hl.env("QT_QPA_PLATFORM","wayland")

-- Autostart
hl.on("hyprland.start", function()
  hl.exec_cmd("waybar &")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("[workspace 7 silent] discord")
  hl.exec_cmd("[workspace 8 silent] hexchat")
  hl.exec_cmd("[workspace 9 silent] youtube-music")
  hl.exec_cmd("nagstamon")
  hl.exec_cmd("easyeffects -w")
  hl.exec_cmd("dunst")
  hl.exec_cmd("alacritty --daemon")
  hl.exec_cmd("local_var_HOME/bin/amdclocks")
end)
