

local File = io.open("day1_input_data.txt")
local FileData = {}
local Amount = 3

io.input(File)

for v in io.lines() do
    FileData[#FileData + 1] = tonumber(v)
end

table.sort(FileData)

function TableConcat(t1,t2)
    for i=1,#t2 do
        t1[#t1+i] = t2[i]
    end
    return t1
end

function GetReport(report, sum, currentSum, index, currentValues)
    for i in pairs(report) do
        i = i + index
        local entrySum = 0

        if report[i] == nil then
            break
        end

        if currentValues ~= nil then
            currentValues[currentSum] = report[i]
        else
            currentValues = {report[i]}
        end

        if sum ~= currentSum then
            entrySum = GetReport(report, sum, currentSum + 1, i, currentValues)
            if entrySum ~= nil then
                return entrySum
            end
        else
            for _,cv in pairs(currentValues) do
                if cv == nil then
                    entrySum = 0
                    break
                end
                entrySum = entrySum + cv
            end
        end

        if entrySum == 2020 then
            local result = 1
            for _,cv in pairs(currentValues) do
                result = result * cv
            end
            return result
        end 
    end

    return nil
end

print(GetReport(FileData, Amount, 1, 0))