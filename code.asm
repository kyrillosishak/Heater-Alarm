include 'emu8086.inc'    

org 100h

jmp start

msg1            DB  'Enter plain text to be encrypted: $' 
red             DB  'red$' 
yellow          DB  'yellow$' 
green           DB  'green$'
newline         DB  0DH,0AH,'$'   

start: 
mov    bx,0 
mov    cx,10h
LEA    dx,msg1  
MOV    ah,09h   
INT    21h

mov    ah, 1
int    21h   
call   parse
mov    ah,0
mov    bx,ax

mov    ah, 1
int    21h   
call   parse
mov    ah,0
mov    dx,ax
mov    ax , bx 
mov    bx , dx
mul    cx
add    bx , ax
               
               
mov    ah, 1
int    21h   
call   parse
mov    ah,0
mov    dx,ax
mov    ax , bx 
mov    bx , dx
mul    cx
add    bx , ax

mov    ah, 1
int    21h   
call   parse
mov    ah,0
mov    dx,ax
mov    ax , bx 
mov    bx , dx
mul    cx
add    bx , ax

LEA    dx,newline  
MOV    ah,09h   
INT    21h  

mov    dx , 0


cmp    bx , 200h
jbe    gren
cmp    bx , 500h
je     r
jb     yelow 

r:
LEA    dx,red  
MOV    ah,09h   
INT    21h

LEA    dx,newline  
MOV    ah,09h   
INT    21h  

jmp ll
gren:
    LEA    dx,green  
    MOV    ah,09h   
    INT    21h 
    
    LEA    dx,newline  
    MOV    ah,09h   
    INT    21h
    
    jmp ll  
yelow: 
    LEA    dx,yellow  
    MOV    ah,09h   
    INT    21h 
    
    LEA    dx,newline  
    MOV    ah,09h   
    INT    21h
    
    jmp    ll
    
ll:

mov     cx, 0abah    
mov     dx, 9500h
mov     ah, 86h
int     15h  

jmp     start
parse proc near:
cmp    al,48
je     zero
cmp    al,49
je     one
cmp    al,50
je     two
cmp    al,51
je     three
cmp    al,52
je     four
cmp    al,53
je     five
cmp    al,54
je     six
cmp    al,55
je     seven
cmp    al,56
je     eight
cmp    al,57
je     nine

zero: 
mov   al,0h
jmp     out
one: 
mov   al,1h
jmp     out
two: 
mov   al,2h
jmp     out
three: 
mov   al,3h
jmp     out
four: 
mov   al,4h
jmp     out
five: 
mov   al,5h
jmp     out
six: 
mov   al,6h
jmp     out 
seven: 
mov   al,7h
jmp     out
eight: 
mov   al,8h
jmp     out
nine: 
mov   al,9h
jmp     out

out: 
ret
parse endp
DEFINE_GET_STRING 
ret
