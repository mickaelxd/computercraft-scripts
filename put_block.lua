term.clear()
print("Iniciando protocolo...")
sleep(1)
print("Colocar blocos")
sleep(2)
print("Certifique-se de que o autonomous activator esta um bloco a frente da turtle e com um hammer.")
sleep(1)
print("Segure Ctrl + T para desativar.")
a = 1
selecionar = 1
turtle.select(selecionar)
if a > 0 then
    turtle.place()
    if turtle.getItemCount(turtle.getSelectedSlot()) = 0 then
        selecionar = selecionar + 1
        turtle.select(selecionar)
    end
end