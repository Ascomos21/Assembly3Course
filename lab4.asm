include 'emu8086.inc'

data segment
 ; add your data here!
 pkey db "Resultat vykonannya programmy$"
ends
stack segment
 dw 128 dup(0)
ends
code segment
start:
; set segment registers:
 
 PRINT "AX="
 CALL SCAN_NUM  
 push cx
 PRINT "BX="
 CALL SCAN_NUM
 push cx
 PRINT "CX="
 CALL SCAN_NUM
 push cx
 PRINT "SI="
 CALL SCAN_NUM
 push cx
 PRINT "DI="  
 CALL SCAN_NUM
 push cx  
 
 
 pop di
 pop si
 pop cx
 pop bx 
 pop ax



 push ax
 mov bp,sp  
 
 or bl ,ch 
 xor di, si   
 mov bh , 0
 and [bp], bx
 and [bp] , di
 
 mov ax, [bp]
 PRINT "ANS="
 CALL PRINT_NUM 
 
 
 

 lea dx, pkey
 mov ah, 9
 int 21h ; output string at ds:dx

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