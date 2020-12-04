

local file = io.open("day1_input_data.txt")
local fileData = {}

io.input(file)

for v in io.lines() do
    fileData[#fileData + 1] = v
end

for _,v in pairs(fileData) do
    for _,v2 in pairs(fileData) do
        if v + v2 == 2020 and v ~= v2 then
            print(v + v2.. ": ".. v * v2)
        end
    end
end
