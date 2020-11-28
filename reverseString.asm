include 'emu8086.inc'
data segment  
    
    text1 db "123451234512345$"
    text2 db 16 dup($)
    count dw 10  
    
    ends
stack segment
    dw   128  dup(0)
ends 
code segment
    start: 
    mov ax,@data
    mov ds, ax
    
    mov cx, count
    mov si, 0
    mov di, 0
    mov di, count
    dec di
    mov ah,0
again:
    cmp si, count
    jne notequals1
    jmp exit1
    notequals1:
    mov al,text1[di]
    mov text2[si], al
    inc si 
    dec di
    mov dl, al
    mov ah,2 
    int 21h       
    loop again
    exit1:    
    mov di, count
againn:
    cmp di, 15
    jne notequals
    jmp exit
    notequals:    
    mov al, text1[di]
    mov text2[di], al
    mov dl, al
    mov ah,2
    int 21h
    inc di
    loop againn
         
    exit:
       mov al, text1[15]
       mov text2[15], al
       
    putc 13
    putc 10 
    mov    dx, OFFSET text2
    mov    ah,9            
    int 21h
                                                        
              ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h   
   ends


DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
end start ;