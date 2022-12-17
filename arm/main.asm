#arm_assembly

push  {r4,r11,lr}  : r4,r11,lr 를 push 한다.
add   r11,sp,#8    : r11=sp+8
sub   sp,sp,#12    : sp=sp-12
mov   r3,#0        : r3=0
str   r3,[r11,#-16] :
ldr   r0,[pc,#104]
bl    0xfbbc <printf>
sub   r3,r11,#16
ldr   r0,[pc,#96]
mov   r1,r3
bl    0xfbd8  <__isoc99_scanf>
bl    0x8cd4  <key1>
mov   r3,r0    :  key1 함수에서의 r0값을 r3로 옮긴다.
bl    0x8cf0  <key2>
mov   r3,r0    :  key2 함수에서의 r0값을 r4로 옮긴다.
add   r2,r4,r3    : r2 = r4 + r3  
ldr   r3,[r11,#-16]
cmp   r2,r3    : r2와 r3를 비교한다.
bne   0x8da8  <main + 108>  : 비교한 값이 같다면 
ldr   r0,[pc,#44]
bl    0x1050c <puts>
ldr   r0,[pc,#40]
bl    0xf89c  <system>
b     0x8db0  <main + 116>
ldr   r0,[pc,#32]
bl    0x1050c <puts>
mov   r3,#0
mov   r0,r3
sub   sp,r11,#8
pop   {r4,r11,pc}
andeq r10,r6,,r12,lsl,#9
