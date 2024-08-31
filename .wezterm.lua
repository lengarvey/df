local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.colors = {
  background = "#282a36",
  foreground = "#f8f8f2",
  cursor_bg = "#f8f8f2",
  cursor_fg = "#282a36",
  cursor_border = "#f8f8f2",
  selection_bg = "#44475a",
  selection_fg = "#f8f8f2",
  ansi = {
    "#282a36",
    "#ff5555",
    "#50fa7b",
    "#f1fa8c",
    "#bd93f9",
    "#ff79c6",
    "#8be9fd",
    "#f8f8f2",
  },
  brights = {
    "#6272a4",
    "#ff6e6e",
    "#69ff94",
    "#ffffa5",
    "#d6acff",
    "#ff92df",
    "#a4ffff",
    "#f8f8f2",
  },
}

config.window_background_opacity = 0.95
config.macos_window_background_blur = 17

return config
