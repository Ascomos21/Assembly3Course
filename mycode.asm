include 'emu8086.inc'


stack segment
 dw 128 dup(0)
ends
code segment
start:
; set segment registers:
 
 PRINT "AX="
 CALL SCAN_NUM  
 push cx
 PUTC 13
 PUTC 10   
 PRINT "BX="
 CALL SCAN_NUM
 push cx
 PUTC 13
 PUTC 10   
 PRINT "CX="
 CALL SCAN_NUM
 push cx
 PUTC 13
 PUTC 10   
 PRINT "SI="
 CALL SCAN_NUM
 push cx
 PUTC 13
 PUTC 10   
 PRINT "DI="  
 CALL SCAN_NUM
 push cx
 PUTC 13
 PUTC 10     
 
 
 pop di
 pop si
 pop cx
 pop bx 
 pop ax
 ; wait for any key....
 mov ah, 1
 int 21h
 mov ah , 0
 
 mov al , ch
 mov si ,di 
 mov bx ,0
 mov bl , al
 push ax
 mov bp,sp
 add [bp], di
 add [bp] , si
 add [bp] , bl
 sub [bp] , ch
 PRINT "AL="
 CALL PRINT_NUM
 
 mov ax, si 
 PUTC 13
 PUTC 10   
 PRINT "SI="
 CALL PRINT_NUM

 mov ax, bx 
 putc 13
 putc 10
 PRINT "BX="
 CALL PRINT_NUM
 pop ax     
  
 PUTC 13
 PUTC 10   
 PRINT "SUM="
 CALL PRINT_NUM

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