local wezterm = require("wezterm")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- default to WSL
config.default_domain = "WSL:Ubuntu"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_opacity = 0.9
config.text_background_opacity = 1.0

config.font = wezterm.font("FiraCode NFM", { weight = "Regular" })
config.font_size = 14.0
config.color_scheme = "OneHalfDark"

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true

return config
