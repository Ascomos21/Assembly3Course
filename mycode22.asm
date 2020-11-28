; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    push dx
    push ax
    
    mul bx
    
    mov dl, dh
    mov dh, 0
    add ax, dx
    mov bx, ax
    
    pop ax
    
    mov cx,ax
    push ax
    mov ax,bx
    mov cl,ch
    mov ch,0
    mul cx
    
    mov bx,ax ;op1
    
    pop ax 
    pop dx
    mul dx
    add ax, dx;op2
    
    cmp bx, ax
    
    jg bilsh
    jle neBilsh
    
    bilsh:
    mov si, 1 
    jmp exit
    nebils
    
    
    
    
    
    
    
    
    
    
    push ax
    push dx
    push cx
    mov ah, 0
    mul BX
    mov dl, dh
    mov dh, 0
    add ax,dx
    mov ch, 0
    div cx
    
    mov bx, ax; op1
    pop ax
    pop dx
    pop cx
    xchg ax, dx
    mov dh, 0
    div dx
    add ax, cx
    
    cmp bx,ax
    jg bilshe
    jle mensheRivne
    bilshe:
    mov si,1
    jmp exit
    mensheRivne:
    mov si,0
    jmp exit
    exit
    
     
    
    ; add your code here
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
