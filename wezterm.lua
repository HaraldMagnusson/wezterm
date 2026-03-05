local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("lua/options").apply_to_config(config)
require("lua/keymaps").apply_to_config(config)

local snort_spits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
snort_spits.apply_to_config(config, {
	modifiers = {
		move = "CTRL",
		resize = "CTRL|SHIFT",
	},
	log_level = "info",
})

return config
