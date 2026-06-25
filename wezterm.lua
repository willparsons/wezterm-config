local wezterm = require("wezterm")
local mux = wezterm.mux
local keymaps = require("keymaps")
local font = require("font")

local stack = wezterm.plugin.require("https://github.com/bad-noodles/stack.wez")

local config = wezterm.config_builder()
stack.apply_to_config(config)

config.max_fps = 240

config.wsl_domains = {
	{
		name = "WSL:Ubuntu",
		distribution = "Ubuntu",
		default_cwd = "/home/will",
		default_prog = { "/home/linuxbrew/.linuxbrew/bin/fish", "-l" },
	},
}

config.default_domain = "WSL:Ubuntu"

config.front_end = "WebGpu"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.font = font.font
config.font_size = font.font_size
config.font_rules = font.font_rules
config.line_height = font.line_height

config.color_scheme_dirs = { "C:\\Users\\willi\\.config\\wezterm\\colors" }
-- config.color_schemes = colors.color_schemes
config.color_scheme = "kanagawa-paper-ink"
-- config.colors = require("colors.kanagawa-dragon").colors
config.force_reverse_video_cursor = false
config.harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" }

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true

config.audible_bell = "Disabled"
config.status_update_interval = 100

config.win32_system_backdrop = "Tabbed"

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

wezterm.on("update-right-status", function(window)
	local zoomed = ""
	for _, pane_info in ipairs(window:active_tab():panes_with_info()) do
		if pane_info.is_zoomed then
			zoomed = "(Z)"
			break
		end
	end
	window:set_right_status(zoomed)
end)

return config
