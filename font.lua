local wezterm = require("wezterm")

local fontName = "MonaspiceNe Nerd Font Mono"

return {
	font = wezterm.font(fontName),
	font_size = 15.0,
	-- For some reason if we use MonaspiceNe this cannot be figured out by wezterm
	font_rules = {
		-- Bold
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font(fontName, { weight = "Bold" }),
		},

		-- Bold-and-italic
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font(fontName, {
				weight = "Bold",
				style = "Italic",
			}),
		},

		-- normal-intensity-and-italic
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font(fontName, {
				style = "Italic",
			}),
		},

		-- half-intensity-and-italic (half-bright or dim); use a lighter weight font
		{
			intensity = "Half",
			italic = true,
			font = wezterm.font(fontName, {
				weight = "Light",
				style = "Italic",
			}),
		},

		-- half-intensity-and-not-italic
		{
			intensity = "Half",
			italic = false,
			font = wezterm.font(fontName, {
				weight = "Light",
			}),
		},
	},
}
