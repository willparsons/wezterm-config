local wezterm = require("wezterm")
local mux = wezterm.mux

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
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

-- config.font = wezterm.font("FiraCode NFM", { weight = "Medium" })
config.font = wezterm.font("FiraCode NFM")
config.font_size = 14.0
config.color_scheme = "kanagawa-dragon"
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }


config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true

config.audible_bell = "Disabled"

wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

return config
