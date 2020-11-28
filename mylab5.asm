include 'emu8086.inc'
data segment
    ; add your data here!
pkey db "Resultat vykonannya programmy$" 
ends
stack segment
    dw   128  dup(0)
ends        
code segment
    start:
; set segment registers:
  PRINT "AX="
    CALL SCAN_NUM
    MOV  AX, CX  
    PUTC 13 
    PUTC 10       
   
    PRINT "BX="
    CALL SCAN_NUM    
    MOV  BX, CX   
    PUTC 10  
    PUTC 13 
    PRINT "CX="
    CALL SCAN_NUM    
    PUSH CX    
    PUTC 10  
    PUTC 13
    PRINT "SI ="
    CALL SCAN_NUM
    MOV SI, CX
    PUTC 10
    PUTC 13
    PRINT "DI ="
    CALL SCAN_NUM
    MOV DI, CX
    PUTC 10
    PUTC 13
    POP CX 
     
    ;create op1
    sub bx, ax
    mov ax, bx
    div si
    mov bx, ax; bx is our op1
    
    ;create op2
    add cx, di
    mov ax, cx
    mul si
    mov dx, ax
    ;dx is our op2
    
    cmp bx, dx
    jg bilsh
    je equals
    ;if not bilsh and not equals this next code will be execute
    mov si, dx
    jmp exit
    ;if don't use exit code will execute in bilsh block
    bilsh:
    mov si, bx
    jmp exit
    equals:
    mov si, 0
    jmp exit
    exit:
      mov ax, si
     PRINT "SI = "
    CALL PRINT_NUM
    
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends


DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

end start ; set entry point and stop the assembler.
    