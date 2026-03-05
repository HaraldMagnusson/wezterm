local wezterm = require("wezterm")
local module = {}

local function map(key, mods, action)
	return { key = key, mods = mods, action = action }
end

local action = wezterm.action

function module.apply_to_config(config)
	config.leader = { key = " ", mods = "CTRL", timout_milliseconds = 2000 }
	config.keys = {
		map("c", "LEADER", action.SpawnTab("CurrentPaneDomain")),
		map("p", "LEADER", action.ActivateTabRelative(-1)),
		map("n", "LEADER", action.ActivateTabRelative(1)),

		-- shift is required for " & % on the swedish keyboard layout
		map("%", "LEADER|SHIFT", action.SplitHorizontal({
			domain = "CurrentPaneDomain",
		})),
		map('"', "LEADER|SHIFT", action.SplitVertical({
			domain = "CurrentPaneDomain",
		})),

		map("m", "LEADER", action.TogglePaneZoomState),

		map("y", "LEADER", action.ActivateCopyMode),
	}

	-- leader + number => goto tab
	for i = 1, 9 do
		table.insert(config.keys,
			map(tostring(i), "LEADER", action.ActivateTab(i - 1))
		)
	end
end

return module
