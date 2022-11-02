local wireless_modem = peripheral.wrap("left")
local tank = peripheral.wrap("right")

while true do
  tankTable = tank.getTanks()
  mainTank = tankTable[1]

  if wireless_modem.isOpen(0) == false then
    wireless_modem.open(0)
  end

  wireless_modem.transmit(0, 1, textutils.serialise(mainTank))
  sleep(1)
end
