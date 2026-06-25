local wezterm = require("wezterm")

local stack = wezterm.plugin.require("https://github.com/bad-noodles/stack.wez")

return {
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bf" }),
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x01" }),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x05" }),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.PaneSelect,
	},

	{ key = "s", mods = "CTRL|SHIFT", action = stack.action.SpawnPane },
	{ key = "k", mods = "CTRL|SHIFT", action = stack.action.ActivatePaneRelative(-1) },
	{ key = "j", mods = "CTRL|SHIFT", action = stack.action.ActivatePaneRelative(1) },
	-- { key = "w", mods = "CTRL", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
}
