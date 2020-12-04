

local file = io.open("day2_input_data.txt")

io.input(file)

local ValidPasswordsCount = 0

for v in io.lines() do
    local minValue = tonumber(string.match(v, "%d+"))
    local maxValue = tonumber(string.match(v, "%-(%d+)"))
    local letter = string.match(v, "(%a)%:")
    local password = string.match(v, ":%s(%a+)")
    local letterCount = 0

    for _ in string.gmatch(password, "["..letter.."]") do
        letterCount = letterCount + 1
    end
    
    if letterCount >= minValue and letterCount <= maxValue then
        ValidPasswordsCount = ValidPasswordsCount + 1 
    end
    print(letterCount)
end

print("valid passwords:".. ValidPasswordsCount)
