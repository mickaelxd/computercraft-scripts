local mon = peripheral.wrap("top")

-- Get the goals from the file as a function and execute it
local goals = loadfile("disk/goals.lua")() 

mon.setTextScale(0.5)
mon.clear()

-- break goals string into lines
-- and write each line to the monitor
local lines = {}

for line in goals:gmatch("([^\r\n]+)") do
  table.insert(lines, line)
end

for i = 1, #lines do
  mon.setCursorPos(1, i)
  mon.write(lines[i])
end


  