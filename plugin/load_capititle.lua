--- Retrieves the highlighted text under a highlighted region and converts it to a string
--- @param region table
--- @return string
local region_to_text = function(region)
	local text = ""
	local maxcol = vim.v.maxcol
	for line, cols in vim.spairs(region) do
		local endcol = cols[2] == maxcol and -1 or cols[2]
		local chunk = vim.api.nvim_buf_get_text(0, line, cols[1], line, endcol, {})[1]
		text = ("%s%s\n"):format(text, chunk)
	end
	return text
end

vim.api.nvim_create_user_command("Capititle", function()
	local r = vim.region(0, "'<", "'>", vim.fn.visualmode(), true)
	local text = require("capititle").capitalize(region_to_text(r))

	vim.cmd("normal! gv c " .. text)
end, { range = true })

print("hello my name is laith")
