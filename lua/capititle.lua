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

--- Checks to see if a word falls under the non capital list
---@param word string
---@return boolean
local is_non_capital = function(word)
  local non_capital = { "a", "an", "and", "but", "nor", "the", "so", "to", "yet" }

  for _, v in ipairs(non_capital) do
    if v == word then
      return true
    end
  end
  return false
end

--- Capitalizes the highlighted text
--- @param line string
M.capitalize = function(line)
  local title = {}
  local split_line = split(line, " ")

  for i, v in ipairs(split_line) do
    if i == 1 or not is_non_capital(v) then
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

return M
