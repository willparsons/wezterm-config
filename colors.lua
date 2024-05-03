local wezterm = require("wezterm")

local gruvbox = wezterm.color.get_builtin_schemes()["Gruvbox Material (Gogh)"]
gruvbox.background = "#1d2021"

return {
	color_schemes = {
		["Gruvbox Material Hard (Gogh)"] = gruvbox,
	},
}
