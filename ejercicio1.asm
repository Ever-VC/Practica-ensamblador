
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; EJERCICIO 1: ALMACENAMIENTO DE DATOS EN MEMORIA

; Inicializando los registros con sus datos
mov AX, 10h
mov BX, 340d

; Sumando o adicionando el contenido de BX dentro de AX
add AX, BX

; Almacenando el resultado de la suma (que esta en AX)
; en una posicion especifica de memoria
mov [0x250], AX