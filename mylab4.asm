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
     ;user push ax will be change  
  
     ;for save result
	 mov bp, sp
	 OR BL, CH
	 XOR DI, SI
	 MOV BH, 0
	 mov bp, ax
	 AND bp, BX
	 and bp, di
	
    
    mov ax,bp
     
    PRINT "RESULT"
    CALL PRINT_NUM
  
    mov ah, 9
    int 21h        ; output string at ds:dx
    ; wait for any key....   
    mov ah, 1
    
    int 21h

    mov ax , 4c00h ; exit to operating system.
    int 21h
ends

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

end start ; set entry point and stop the assembler.
    