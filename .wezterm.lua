local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false

config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	-- font = wezterm.font({ family = "Roboto", weight = "Bold" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 14.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#282a36",

	-- The overall background color of the tab bar when
	-- the window is not focused
	-- inactive_titlebar_bg = "#333333",
}

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		-- inactive_tab_edge = "#575757",
	},
}

config.window_decorations = "RESIZE | MACOS_FORCE_ENABLE_SHADOW"
config.window_padding = { left = 15, right = 15, top = 15, bottom = 0 }

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

config.keys = {
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
}

-- config.default_prog = { '/opt/homebrew/bin/nu' }

return config
