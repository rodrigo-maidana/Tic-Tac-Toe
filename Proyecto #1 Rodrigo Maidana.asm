;;RODRIGO MAIDANA
.model small
.stack 100h
.data
    
    ;;Si la posicion no esta ocupada, la variable mantendra valor 45d, si tiene una X valor 88d y si tiene una 0 valor 48d
    pos1 db 45d
    pos2 db 45d
    pos3 db 45d
    pos4 db 45d
    pos5 db 45d
    pos6 db 45d
    pos7 db 45d
    pos8 db 45d
    pos9 db 45d
    
    drawChecker db 0d
    
    gameExplanation dw "El tablero esta distribuido asi:",10,13,'$'
    boardPreview dw "  1      |2      |3      ",10,13,"        |       |       ",10,13,"        |       |       ",10,13," -------+-------+-------",10,13," 4      |5      |6      ",10,13,"        |       |       ",10,13,"        |       |       ",10,13," -------+-------+-------",10,13," 7      |8      |9      ",10,13,"        |       |       ",10,13,"        |       |       ",10,13,'$'
    
    ;;boardPreviw esta ordenado de la siguiente forma:
    ;       " 1      |2      |3      "
    ;       "        |       |       "
    ;       "        |       |       "
    ;       " -------+-------+-------" 
    ;       " 4      |5      |6      "
    ;       "        |       |       "
    ;       "        |       |       "
    ;       " -------+-------+-------"
    ;       " 7      |8      |9      "
    ;       "        |       |       "
    ;       "        |       |       " 
    
    askForValue db "Ingrese la posicion donde desea colocar la X (1 al 9): $"
    askForValuePC db "Juega la maquina: $"
    askAgainTxt db "El valor ingresado no es valido, o ya esta ocupado, intente de nuevo: $"
    
    userWinsTxt db "Gano usted!!$"
    PCWinsTxt db "Gano la computadora!!$"
    DrawTxt db "Es un empate!!$"
                           
   
.code
start:
    mov ax,@data
    mov ds,ax
       
    call printGamePreview
    
    userStarts:
    ;;1.
    call UserTurn   
    call checkWin
    
    pcStarts:
    ;;2.
    call PCTurn
    call checkWin
    
    ;;Repeat
    jmp userStarts
    
    
    
    
    call finish
    
    
    
    
    
    ;;SUB-RUTINAS
    
    ;;Juega el usuario
    UserTurn:
        push ax ; save ax
        push bx ; save bx
        push cx ; save cx
        push dx ; save dx
    
        call putLine
        
        mov dx, offset askForValue
        call puts
        
        askNum:
        call getDecimal
        
        ;checkPositions:
        cmp al,01d
        jz checkPos1User
        
        cmp al,02d
        jz checkPos2User
        
        cmp al,03d
        jz checkPos3User
        
        cmp al,04d
        jz checkPos4User
        
        cmp al,05d
        jz checkPos5User
        
        cmp al,06d
        jz checkPos6User
        
        cmp al,07d
        jz checkPos7User
        
        cmp al,08d
        jz checkPos8User
        
        cmp al,09d
        jz checkPos9User
        
        jmp askAgain
        
        endUserCheck:         
        pop dx ; restore dx
        pop cx ; restore cx
        pop bx ; restore bx
        pop ax ; restore ax
        ret
    ;;Juega la maquina    
    PcTurn:
        push ax ; save ax
        push bx ; save bx
        push cx ; save cx
        push dx ; save dx
    
        call putLine
        
        mov dx, offset askForValuePC
        call puts
        
        rng:
        call getRNG
        
        ;checkPositions:
        cmp al,01d
        jz checkPos1PC
        
        cmp al,02d
        jz checkPos2PC
        
        cmp al,03d
        jz checkPos3PC
        
        cmp al,04d
        jz checkPos4PC
        
        cmp al,05d
        jz checkPos5PC
        
        cmp al,06d
        jz checkPos6PC
        
        cmp al,07d
        jz checkPos7PC
        
        cmp al,08d
        jz checkPos8PC
        
        cmp al,09d
        jz checkPos9PC
        
        jmp rng
        
        endPcCheck:         
        pop dx ; restore dx
        pop cx ; restore cx
        pop bx ; restore bx
        pop ax ; restore ax
        ret    
    
    ;;Verificamos valor en pos1 (Para el usuario)
    checkPos1User:
        cmp pos1, 45d
        jne askAgain
        mov pos1, 88d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endUserCheck 
    
    ;;Verificamos valor en pos2 (Para el usuario)
    checkPos2User:
        cmp pos2, 45d
        jne askAgain
        mov pos2, 88d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endUserCheck
    
    ;;Verificamos valor en pos3 (Para el usuario)
    checkPos3User:
        cmp pos3, 45d
        jne askAgain
        mov pos3, 88d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endUserCheck
    
    ;;Verificamos valor en pos4 (Para el usuario)
    checkPos4User:
        cmp pos4, 45d
        jne askAgain
        mov pos4, 88d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endUserCheck
    
    ;;Verificamos valor en pos5 (Para el usuario)
    checkPos5User:
        cmp pos5, 45d
        jne askAgain
        mov pos5, 88d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endUserCheck
        
    ;;Verificamos valor en pos6 (Para el usuario)
    checkPos6User:
        cmp pos6, 45d
        jne askAgain
        mov pos6, 88d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endUserCheck
        
    ;;Verificamos valor en pos7 (Para el usuario)
    checkPos7User:
        cmp pos7, 45d
        jne askAgain
        mov pos7, 88d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endUserCheck
        
    ;;Verificamos valor en pos8 (Para el usuario)
    checkPos8User:
        cmp pos8, 45d
        jne askAgain
        mov pos8, 88d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endUserCheck
        
    ;;Verificamos valor en pos9 (Para el usuario)
    checkPos9User:
        cmp pos9, 45d
        jne askAgain                
        mov pos9, 88d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endUserCheck
    
    ;;Verificamos valor en pos1 (Para la maquina)
    checkPos1PC:
        cmp pos1, 45d
        jne rng
        mov pos1, 48d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endPcCheck
    
    ;;Verificamos valor en pos2 (Para la maquina)
    checkPos2PC:
        cmp pos2, 45d
        jne rng
        mov pos2, 48d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endPcCheck
    
    ;;Verificamos valor en pos3 (Para la maquina)
    checkPos3PC:
        cmp pos3, 45d
        jne rng
        mov pos3, 48d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endPcCheck
    
    ;;Verificamos valor en pos4 (Para el usuario)
    checkPos4PC:
        cmp pos4, 45d
        jne rng
        mov pos4, 48d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endPcCheck
    
    ;;Verificamos valor en pos5 (Para el usuario)
    checkPos5PC:
        cmp pos5, 45d
        jne rng
        mov pos5, 48d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endPcCheck
    
    ;;Verificamos valor en pos6 (Para el usuario)
    checkPos6PC:
        cmp pos6, 45d
        jne rng
        mov pos6, 48d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endPcCheck
    
    ;;Verificamos valor en pos7 (Para el usuario)
    checkPos7PC:
        cmp pos7, 45d
        jne rng
        mov pos7, 48d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endPcCheck
        
    ;;Verificamos valor en pos8 (Para el usuario)
    checkPos8PC:
        cmp pos8, 45d
        jne rng
        mov pos8, 48d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endPcCheck
        
    ;;Verificamos valor en pos9 (Para el usuario)
    checkPos9PC:
        cmp pos9, 45d
        jne rng
        mov pos9, 48d
        inc drawChecker
        
        call putLine
        call putBoard
        jmp endPcCheck                                
        
        
    ;;Verificamos si hay 3 en linea
    checkWin:
        push ax ; save ax
        push bx ; save bx
        push cx ; save cx
        push dx ; save dx
        horizontal1:            ;;Verificamos si la 1ra horizontal son todos iguales    
            mov al, pos1
            
            cmp al, 45d         ;;Excluimos - de la igualdad
            je horizontal2
            
            mov bl, pos2
            cmp al, bl
            jne horizontal2
            
            mov bl, pos3
            cmp al, bl
            jne horizontal2
            
            call verifyIfUserOrPc
            
        horizontal2:            ;;Verificamos si la 2da horizontal son todos iguales
            mov al, pos4
            
            cmp al, 45d         ;;Excluimos - de la igualdad
            je horizontal3
            
            mov bl, pos5
            cmp al, bl
            jne horizontal3
            
            mov bl, pos6
            cmp al, bl
            jne horizontal3
            
            call verifyIfUserOrPc
            
        horizontal3:            ;;Verificamos si la 3ra horizontal son todos iguales
            mov al, pos7
            
            cmp al, 45d         ;;Excluimos - de la igualdad
            je vertical1
            
            mov bl, pos8
            cmp al, bl
            jne vertical1
            
            mov bl, pos9
            cmp al, bl
            jne vertical1
            
            call verifyIfUserOrPc
            
        vertical1:
            mov al, pos1
                                
            cmp al, 45d             ;;Excluimos - de la igualdad
            je vertical2
            
            mov bl, pos4
            cmp al, bl
            jne vertical2
            
            mov bl, pos7
            cmp al, bl
            jne vertical2
            
            call verifyIfUserOrPc
            
        vertical2:
            mov al, pos2
            
            cmp al, 45d             ;;Excluimos - de la igualdad
            je vertical3
            
            mov bl, pos5
            cmp al, bl
            jne vertical3
            
            mov bl, pos8
            cmp al, bl
            jne vertical3
            
            call verifyIfUserOrPc
            
        vertical3:
            mov al, pos3
            
            cmp al, 45d             ;;Excluimos - de la igualdad
            je diagonal1
            
            mov bl, pos6
            cmp al, bl
            jne diagonal1
            
            mov bl, pos9
            cmp al, bl
            jne diagonal1
            
            call verifyIfUserOrPc
            
        diagonal1:
            mov al, pos1
            
            cmp al, 45d             ;;Excluimos - de la igualdad
            je diagonal2
            
            mov bl, pos5
            cmp al, bl
            jne diagonal2
            
            mov bl, pos9
            cmp al, bl
            jne diagonal2
            
            call verifyIfUserOrPc
            
        diagonal2:
            mov al, pos3
            
            cmp al, 45d             ;;Excluimos - de la igualdad
            je drawCheck
            
            mov bl, pos5
            cmp al, bl
            jne drawCheck
            
            mov bl, pos7
            cmp al, bl
            jne drawCheck
            
            call verifyIfUserOrPc
            
        drawCheck:
            mov al, drawChecker      ;;Si se aplico algun cambio retorna, si no, pide valor de nuevo
            cmp al, 9d
            je Draw                 ;;Pero si la variables empate, es mayor a 10, cantamos el empate 
            
        endChecking:
        pop dx ; restore dx
        pop cx ; restore cx
        pop bx ; restore bx
        pop ax ; restore ax
        ret        
    
    UserWins:
        call putLine
        mov dx, offset userWinsTxt
        call puts
        call finish
    
    PCWins:
        call putLine
        mov dx, offset PCWinsTxt
        call puts
        call finish
    
    Draw:
        call putLine
        mov dx, offset DrawTxt
        call puts
        call finish
        
    verifyIfUserOrPc:
        cmp al, 88d
        je UserWins
        
        cmp al, 48d
        je PCWins
                         
    ;;Valor no valido o ya ingresado, intente de nuevo
    askAgain:
        push ax ; save ax
        push bx ; save bx
        push cx ; save cx
        push dx ; save dx
        
        call putLine
        
        mov dx, offset askAgainTxt
        call puts
        
        pop dx ; restore dx
        pop cx ; restore cx
        pop bx ; restore bx
        pop ax ; restore ax 
        jmp askNum
        
    ;;Random number generator (RNG)
    ;;Fuente: https://stackoverflow.com/questions/17855817/generating-a-random-number-within-range-of-0-9-in-x86-8086-assemblyz
    getRNG:
       MOV AH, 00h  ; interrupts to get system time        
       INT 1AH      ; CX:DX now hold number of clock ticks since midnight      
    
       mov  ax, dx
       xor  dx, dx
       mov  cx, 10    
       div  cx       ; here dx contains the remainder of the division - from 0 to 9
    
       mov ax, dx
       RET           
    
    ;;Imprimimos el Tablero
    putBoard:
        push ax ; save ax
        push bx ; save bx
        push cx ; save cx
        push dx ; save dx
        
        ;;Imprime la linea superior
        mov dl, pos1
        call putc
        mov dl, pos2
        call putc
        mov dl, pos3
        call putc
        
        call putLine
        
        ;;Imprime la linea Central
        mov dl, pos4
        call putc
        mov dl, pos5
        call putc
        mov dl, pos6
        call putc
        
        call putLine
        
        ;;Imprime la linea inferior
        mov dl, pos7
        call putc
        mov dl, pos8
        call putc
        mov dl, pos9
        call putc
        
        call putLine
        
        
        pop dx ; restore dx
        pop cx ; restore cx
        pop bx ; restore bx
        pop ax ; restore ax 
        ret
    
    printGamePreview:
        push ax ; save ax
        push bx ; save bx
        push cx ; save cx
        push dx ; save dx
        
        mov dx, offset gameExplanation
        call puts
        
        call putLine
        
        mov dx, offset boardPreview
        call puts
        
        pop dx ; restore dx
        pop cx ; restore cx
        pop bx ; restore bx
        pop ax ; restore ax 
        ret
        
    ;limpia la pantalla del MS-DOS
    clearScreen:         
        push ax ; save ax
        push bx ; save bx
        push cx ; save cx
        push dx ; save dx
        mov ah,00h
        mov al,03h       
        int 10h
        pop dx ; restore dx
        pop cx ; restore cx
        pop bx ; restore bx
        pop ax ; restore ax    
        ret
        
    ;;Agrega un salto de linea
    putLine:
        push ax
        push bx
        push cx
        push dx
        
        mov dl, 13d
        call putc
        
        mov dl, 10d
        call putc
        
        pop dx
        pop cx
        pop bx
        pop ax
        ret  
    
    ;;Ingresa chart por teclado
    getc:
        push bx
        push cx
        push dx 
        
        mov ah, 1h
        int 21h
        
        pop dx
        pop cx
        pop bx
        ret
    
    ;;Imprimimos un caracter   
    putc:
        push ax
        push bx
        push cx
        push dx  
        
        mov ah, 2h
        int 21h  
        
        pop dx
        pop cx
        pop bx
        pop ax 
        ret 
    
    ;;Ingresa un decimal
    getDecimal:
        push bx
        push cx
        push dx
        
        mov ah, 1h
        int 21h
        sub al, 30h
        
        pop dx
        pop cx
        pop bx
        ret
        
    ;;Metodo imprime 4 digitos 
    ;;Fuente: https://stackoverflow.com/questions/40864619/adding-4-digit-numbers-and-displaying-sum-assembly-language
    
    PRINT_DIGITOS:
        xor  cx,cx   ;Counts the digits
        mov  bx,10   ;Fixed divider
        
        more:
            xor  dx,dx   ;Word division needs to zero DX!
            div  bx
            push dx      ;Remainder [0,9]
            inc  cx      ;One digit more
            test ax,ax
            jnz  more    ;Continu until AX is empty
        
        next:
            pop  dx
            add  dl,48   ;Turn into a character, from [0,9] to ["0","9"]
            mov  ah,02h  ;DOS DisplayCharacter function
            int  21h
            loop next    ;Continu for all digits (*)
        ret
         
    ;;Imprimimos un string
    puts:
        push ax
        push bx
        push cx
        push dx  
        
        mov ah, 9h
        int 21h
        
        pop dx
        pop cx
        pop bx
        pop ax
        ret
    
    ;;Reproduce BEEP
    putBeep:
        push ax
        push bx
        push cx
        push dx
        
        mov dl, 07h
        call putC
        
        pop dx
        pop cx
        pop bx
        pop ax
        ret 
    
    ;;Liberamos recursos del procesador
    finish:
        mov ax, 4c00h  
        int 21h
        ret

end start