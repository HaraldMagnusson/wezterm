local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
	config.automatically_reload_config = true
	-- config.color_scheme = "Chameleon (Gogh)"
	config.color_scheme = "tokyonight"

	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		config.default_prog = { "pwsh.exe" }
		config.default_cwd = "D:"
	end

	config.window_background_opacity = 0.9
	config.text_background_opacity = 0.8

	config.hide_tab_bar_if_only_one_tab = true
	config.window_decorations = "TITLE | RESIZE"
	config.window_padding = {
		top = 10,
		bottom = 10,
		left = 10,
		right = 10,
	}
end

return module
