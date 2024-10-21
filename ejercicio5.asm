.MODEL
.STACK 100h

.DATA
    mensaje db 'Ingrese un numero [entero]: $'
    buffer db 5 DUP('$') ; Reserva 5 bytes de espacio en el buffer para el numero ingresado, llenado con $
    
    resultado db 'El numero ingresado es: $' ; Mensaje para mostrar el resultado
    saltoLinea db 13, 10, '$' ; 13 => Codigo ascii de salto de linea, 10 => line feed
    
.CODE
inicio: 
    
    ; Inicializa el segmento de datos
    mov AX, @Data ; Carga la direccion del mensaje en DX            
    mov DS, AX ; Mueve el contenido de AX al registro DS (el segmento de datos)
    
    ; Imprime el mensaje de solicitud
    mov DX, offset mensaje ; Carga la direccion del mensaje en DX
    mov AH, 9 ; Funcion 9 de la interrupcion 21h para mostrar el mensaje
    int 21h ; Interrupcion 21h para mostrar el mensaje
    
    ; Leer el numero ingresado por consola
    mov DX, offset buffer ; Carga la direccion del buffer en DX
    mov AH, 0Ah ; Funcion 0Ah de la interrupcion 21h para leer cadena de texto desde la entrada estandar
    int 21h ; Interrupcion 21h para leer el numero ingresado

    ; Imprimir salto de linea
    mov DX, offset saltoLinea
    mov AH, 9
    int 21h
    
    ; Imprime el mensaje de resultado
    mov DX, offset resultado ; Carga la direccion del mensaje de resultado en DX
    mov AH, 9 ; Funcion 9 de la interrupcion 21h para imprimir la cadena
    int 21h ; Interrupcion 21h para mostrar el resultadoo
    
    ; Imprimir el numero ingresado
    mov DX, offset buffer + 2 ; Salta los 1ros 2 bytes del buffer (tamanio y numero de caracteres)
    mov AH, 9 ; Funcion 9 de la interrupcion 21h para imprimir la cadena
    int 21h ; Imprime el numero con la interrupcion 21h
    
    ; Finaliza el programa
    mov AX, 4C00h ; Funcion 4Ch de la interrupcion 21h para temrinar el programa
    int 21h
END inicio
