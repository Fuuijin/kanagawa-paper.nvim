local util = require("kanagawa-paper.lib.util")

local M = {}

-- Convert hex color to RGB values
local function hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	local r = tonumber(hex:sub(1, 2), 16)
	local g = tonumber(hex:sub(3, 4), 16)
	local b = tonumber(hex:sub(5, 6), 16)
	return r .. " " .. g .. " " .. b
end

--- @param colors ThemeColors
function M.generate(colors)
	-- Convert all hex colors to RGB
	local rgb_colors = {}
	for k, v in pairs(colors) do
		if type(v) == "table" then
			rgb_colors[k] = {}
			for sk, sv in pairs(v) do
				if type(sv) == "string" and sv:match("^#%x%x%x%x%x%x$") then
					rgb_colors[k][sk] = hex_to_rgb(sv)
				end
			end
		elseif type(v) == "string" and v:match("^#%x%x%x%x%x%x$") then
			rgb_colors[k] = hex_to_rgb(v)
		end
	end

	local zellij = util.template(
		[[
// -----------------------------------------------------------------------------
// ${_style_name}
// Upstream: ${_upstream_url}
// URL: ${_url}
// -----------------------------------------------------------------------------

themes {
    ${_name} {
        fg ]] .. hex_to_rgb(colors.ui.fg) .. [[

        bg ]] .. hex_to_rgb(colors.ui.bg) .. [[

        black ]] .. hex_to_rgb(colors.term.black) .. [[

        red ]] .. hex_to_rgb(colors.term.red) .. [[

        green ]] .. hex_to_rgb(colors.term.green) .. [[

        yellow ]] .. hex_to_rgb(colors.term.yellow) .. [[

        blue ]] .. hex_to_rgb(colors.term.blue) .. [[

        magenta ]] .. hex_to_rgb(colors.term.magenta) .. [[

        cyan ]] .. hex_to_rgb(colors.term.cyan) .. [[

        white ]] .. hex_to_rgb(colors.term.white) .. [[

        orange ]] .. hex_to_rgb(colors.accent.accent2) .. [[

    }
}
]],
		colors
	)
	return zellij
end

return M
