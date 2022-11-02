local monitor_location = "top"
local wireless_location = "right"
local modem_frequency = 0

local monitor = peripheral.wrap(monitor_location)
local wireless_module = peripheral.wrap(wireless_location)
local warning = 20
local capacity
local amount
local percentfull
local lastpercent = 1000
local sleeptime
local liquid_content = "Lava"

wireless_module.open(modem_frequency)

-- Set warning lamp to off
redstone.setOutput("right", false)

-- Main prog loop, never stop
while true do
  event, modemSide, senderChannel, senderID, message, distance = os.pullEvent("modem_message")
  maintank = textutils.unserialise(message)

  capacity = maintank.capacity / 1000
  amount = maintank.amount

  if amount == nil then
    amount = 0
    percentfull = 0
  else
    amount = math.floor(amount / 1000)
    percentfull = math.floor(100 * amount / capacity)
  end

  -- Self explanatory :)/>
  monitor.clear()
  monitor.setBackgroundColor(colors.black)
  monitor.setTextColor(colors.white)
  monitor.setCursorPos(1, 1)

  monitor.write(liquid_content)
  monitor.setCursorPos(1, 2)
  monitor.write("QTD: " .. amount .. "/" .. capacity .. " B.")
  monitor.setCursorPos(1, 3)
  monitor.write(percentfull .. "%")

  -- Save for next loop
  lastpercent = percentfull

  -- Warning control, local lamp
  monitor.setCursorPos(1, 5)

  if percentfull < warning then
    redstone.setOutput("right", true)
    monitor.setBackgroundColor(colors.red)
    monitor.setTextColor(colors.black)
    mon.write("Apenas " .. percentfull .. "% do máximo")
    sleep(1)
    redstone.setOutput("right", false)
    sleeptime = 1
  else
    -- Above warning level, sleep longer
    mon.write("More than " ..warning .."% full")
    sleeptime = 10
  end

  -- Sleep either 1 or 10 seconds
  sleep(sleeptime)
end
