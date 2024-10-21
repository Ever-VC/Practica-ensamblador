
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; EJERCICO 3: LOOP Y START
mov CX, 5 ; Condicion de la cual depende el loop
start:
    mov AH, 09h
    lea DX, msj ; Carga la direccion del mensaje en el DX
    int 21h ; Abre la consola
    
    mov AH, 02h ; Imprime 1 caracter
    mov DX, 0Dh ; Caracter de retorno del mismo carril
    int 21h
    mov DL, 0Ah ; Permite hacer salto de linea
    int 21h
    
    loop start ; Permite que todo lo que esta arriba se ejecute, hasta que se cumpla cierta condicion

  mov AX, 4C00h ; Le indica un codigo de salida para terminar la ejecucion del programa
  int 21h                         
    
msj db 'Se repetira este mensaje 5 veces$'
ret




