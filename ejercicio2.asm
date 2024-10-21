
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; EJERCICIO 2: HOLA MUNDO :) 

; Declarando una interrupcion
mov AH, 09h ; Lee la informacion del registro  

; Carga el mensaje en el registro DX
mov DX, offset msj

int 21h ; Abre la consola (interrupcion)

mov AH, 4Ch ; Ayuda a deterner el programa

int 21h

; Declarando el mensaje
msj db 'Hola Mundo  :)$',0 
ret