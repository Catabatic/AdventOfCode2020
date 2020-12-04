

local file = io.open("day3_input_data.txt")
local FileData = {}

io.input(file)

getmetatable("").__index = function(str, i) 
    return string.sub(str, i, i)
end

for v in io.lines() do
    FileData[#FileData + 1] = v
end

local Right = 3
local Down = 1
local CurrentPoint = FileData[1][1]
local CurrentPointPos = 1
local CurrentMapPos = FileData[1]
local MaxPointPos = #FileData[1]
local TreesEncountered = 0

for i = 1 + Down, #FileData, Down do
    CurrentMapPos = FileData[i]
    CurrentPointPos = CurrentPointPos + Right

    if CurrentPointPos > MaxPointPos then
        CurrentPointPos = CurrentPointPos - MaxPointPos
    end

    CurrentPoint = FileData[i][CurrentPointPos]

    if CurrentPoint == "#" then
        TreesEncountered = TreesEncountered + 1
    end
end

print("Trees encountered: ".. TreesEncountered)
