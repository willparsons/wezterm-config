local wezterm = require("wezterm")
local colors = require("colors")
local mux = wezterm.mux
local keymaps = require("keymaps")
local font = require("font")

local config = wezterm.config_builder()

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.font = font.font
config.font_rules = font.font_rules
config.font_size = font.font_size

config.color_schemes = colors.color_schemes
config.color_scheme = "Gruvbox Material Hard (Gogh)"
config.force_reverse_video_cursor = true
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true

config.audible_bell = "Disabled"

-- maximize all displayed windows on startup
wezterm.on("gui-attached", function(_)
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			window:gui_window():maximize()
		end
	end
end)

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = keymaps

return config
