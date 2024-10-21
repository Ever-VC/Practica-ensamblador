name "Hola mundo 2"

org 100h

; EJERCICIO 4: HOLA MUNDO, LETRA POR LETRA Y CON COLORES XD
mov AX, 3 ; Carga los colores que tiene internamente MS2
int 10h
            
; Desactiva el parpadeo y habilita todos los 16 colores
mov AX, 1003h
mov BX, 0
int 10h

; Establece el registro de sergmento
mov AX, 0b800h ; Carga AX con la direccion de la memoria de video en modo texto 
mov DS, AX ; Establece el registro de sergmenteo DS a la direccion indicada

; Imprime el Hola Mundo
; Cada instruccion 'mov' escribe un caracter y su atributo de color en la memoria de video
mov [02d], 'H'
mov [04d], 'o'
mov [06d], 'l'
mov [08d], 'a'
mov [10d], ' '
mov [12d], 'M'
mov [14d], 'u'
mov [16d], 'n'
mov [18d], 'd'
mov [20d], 'o'
mov [22d], '!'

; Establece el color de todos los caracteres
mov CX, 11
mov DI, 03h

c:
    mov [DI], 11101010b ; Configura el dolor para el caracter actual
    add DI, 2 ; Salta al siguiente caracter (en paso de 2 por como se establecio en la memoria)
    loop c ; Repite el proceso hasa que CX llehie a 0

; Espera a que se precione una tecla para continuar
mov AH, 0 ; Establece a AH en 0 para esperar una tecla
int 16h ; Llama a la interrupcion 16 para esperar la tecla

ret ; Retorna el programa    