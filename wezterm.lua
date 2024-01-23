local wezterm = require("wezterm")
local mux = wezterm.mux
local keymaps = require("keymaps")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular" })
config.font_size = 24.0
config.color_scheme = "kanagawabones"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true

config.audible_bell = "Disabled"

wezterm.on("gui-attached", function(_)
	-- maximize all displayed windows on startup
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			window:gui_window():maximize()
		end
	end
end)

config.keys = keymaps

return config
