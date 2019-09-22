term.clear()
print("Iniciando protocolo de mineracao, certifique-se de que nao ha blocos valiosos ao redor")
sleep(2)
print("Protocolo carregado com sucesso.")
sleep(2)
print("Segure Ctrl + T para desativar.")
a = 1
while a ~=50 do
	if a > 0 then
		turtle.turnRight()
		turtle.dig()
		turtle.turnLeft()
		turtle.turnLeft()
		turtle.dig()
		turtle.turnRight()
		if 	turtle.getItemCount(16) == 64 then
			print("Verificar se ha espaco na mineradora")
			break
		end
	end
end