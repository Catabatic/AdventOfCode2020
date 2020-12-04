

local file = io.open("day2_input_data.txt")

io.input(file)

local ValidPasswordsCount = 0

getmetatable("").__index = function(str, i) 
    return string.sub(str, i, i)
end

for v in io.lines() do
    local firstPos = tonumber(string.match(v, "%d+"))
    local secondPos = tonumber(string.match(v, "%-(%d+)"))
    local letter = string.match(v, "(%a)%:")
    local password = string.match(v, ":%s(%a+)")

    if (password[firstPos] == letter and password[secondPos] ~= letter) or (password[firstPos] ~= letter and password[secondPos] == letter) then
        ValidPasswordsCount = ValidPasswordsCount + 1 
    end
end

print("valid passwords:".. ValidPasswordsCount)
