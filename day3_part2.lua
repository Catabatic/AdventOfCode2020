

local file = io.open("day3_input_data.txt")
local FileData = {}

io.input(file)

getmetatable("").__index = function(str, i) 
    return string.sub(str, i, i)
end

for v in io.lines() do
    FileData[#FileData + 1] = v
end

local Slopes = {
    {
        Right = 1,
        Down = 1
    },
    {
        Right = 3,
        Down = 1
    },
    {
        Right = 5,
        Down = 1
    },
    {
        Right = 7,
        Down = 1
    },
    {
        Right = 1,
        Down = 2
    }
}

local TreesEncounteredMT = {}
local TreesEncountered = {}
local CurrentPoint = FileData[1][1]
local MaxPointPos = #FileData[1]
local TreesMultiplied = 1
local index = 0
local maxIndex = #FileData

setmetatable(TreesEncountered, TreesEncounteredMT)
TreesEncounteredMT.__index = function()
    return 0
end

for k, v in pairs(Slopes) do
    local CurrentPointPos = 1
    for i = 1 + v["Down"], #FileData, v["Down"] do
        CurrentPointPos = CurrentPointPos + v["Right"]
    
        if CurrentPointPos > MaxPointPos then
            CurrentPointPos = CurrentPointPos - MaxPointPos
        end
    
        CurrentPoint = FileData[i][CurrentPointPos]
    
        if CurrentPoint == "#" then
            TreesEncountered[k] = TreesEncountered[k] + 1
        end
        index = i
    end
    TreesMultiplied = TreesMultiplied * TreesEncountered[k]
end



print("Trees multiplied: ".. TreesMultiplied)
