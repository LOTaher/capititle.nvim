local M = {}

--- Splits a string into a table based off a seperator
--- @param input string
--- @param sep string
--- @return table
local split = function(input, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(input, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end

--- Capitalizes the highlighted text
--- @param line string
M.capitalize = function(line)
	print("recieved: ", line)
	local title = {}
	local split_line = split(line, " ")

	for i, v in ipairs(split_line) do
		if #v > 3 or i == 1 then
			local first_letter = string.upper(string.sub(v, 1, 1))
			local rest_word = string.lower(string.sub(v, 2))

			table.insert(title, first_letter .. rest_word)
		else
			local lowercase_word = string.lower(string.sub(v, 1))
			table.insert(title, lowercase_word)
		end
	end

	return table.concat(title, " ")
end

local cap = M.capitalize("hello my name is laith")
print(cap) -- The Quick Brown fox Jumped Over the Lazy dog

return M
