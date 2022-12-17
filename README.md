# leg
![leg_c](https://user-images.githubusercontent.com/107084512/208231173-4b5ce66e-4427-4266-844f-1665a290dd1b.png)
c코드를 보면 중간에 pc라는 것을 볼 수 있다. 구글링해서 찾아본 결과 pc는 EIP처럼 현재 수행하고 있는 주소값을 알려주는 레지스터이다.
정확한 값을 알기 위해서는 주어진 leg.asm 어셈블리 파일을 통해서 주소값을 확인해야한다고 생각했다.

![leg_main](https://user-images.githubusercontent.com/107084512/208231175-c0368c52-13ea-47ac-ba8a-9b74164fbaea.png)

![leg_key](https://user-images.githubusercontent.com/107084512/208231183-49f7fe6a-ee58-413d-96b3-d38f6a41e836.png)


솔루션: leg.c파일을 컴파일하고 gdb로 key1(),key2(),key3() 값을 알아내고 실행해서 key값에 알맞는 값을 넣어서 답을 구한다.<br>
->오류로 인해 컴파일이 되지않아 실행파일을 구할 수 없음<br>
->서버에 접속해서 실행할 수 있고 leg.asm 파일을 이미 가지고 있어서 leg.asm 파일을 보면서 key값들을 유추할 수 있다.<br>


push  {r4,r11,lr}                       # r4,r11,lr 를 push 한다.
add   r11,sp,#8                         # r11=sp+8
sub   sp,sp,#12                         # sp=sp-12
mov   r3,#0                             # r3=0
str   r3,[r11,#-16]                     #
ldr   r0,[pc,#104]                      #
bl    0xfbbc <printf>                   #
sub   r3,r11,#16                        #
ldr   r0,[pc,#96]                       #   
mov   r1,r3                             #
bl    0xfbd8  <__isoc99_scanf>          #
bl    0x8cd4  <key1>                    #
mov   r4,r0                             # key1 함수에서의 r0값을 r3로 옮긴다.
bl    0x8cf0  <key2>                    #
mov   r3,r0                             # key2 함수에서의 r0값을 r4로 옮긴다.
add   r4,r4,r3                          # r4 = r4 + r3  
bl    0x8cf0  <key3>                    #
mov   r3,r0                             # r3 = r0(key3에서 가져온 r0값이다)
add   r2,r4,r3                          # r2 = r3+r4        
ldr   r3,[r11,#-16]                     #
cmp   r2,r3    : r2와 r3를 비교한다.     #
bne   0x8da8  <main + 108>              #
ldr   r0,[pc,#44]                       #
bl    0x1050c <puts>                    #
ldr   r0,[pc,#40]                       #
bl    0xf89c  <system>                  #
b     0x8db0  <main + 116>              #
ldr   r0,[pc,#32]                       #
bl    0x1050c <puts>                    #
mov   r3,#0                             #
mov   r0,r3                             #
sub   sp,r11,#8                         #
pop   {r4,r11,pc}                       #
andeq r10,r6,,r12,lsl,#9                #


0x00008cd4<+0>:     push  {r11}         # 레지스터 r11을 push한다.
0x00008cd8<+4>:     add   r11,sp,#0     # r11 = sp(0x00007cd8) + 0
0x00008cdc<+8>:     mov   r3,pc         # r3=pc(0x00007cdc) **pc는 어느 주소를 가져오는 것인가
0x00008ce0<+12>:    mov   r0,r3         # r0=r3(0x00007cdc)
0x00008ce4<+16>:    sub   sp,r11,#0     # sp= r11 - 0 
0x00008ce8<+20>:    pop   {r11}         # r11(0x00007cd8)을 pop(빼낸다)
0x00008cec<+24>:    bx    lr            # 원래 함수로 돌아간다.


0x00008cf0<+0>:     push  {r11}         #
0x00008cf4<+4>:     add    r11,sp,#0    #
0x00008cf8<+8>:     push   {r6}         #
0x00008cfc<+12>:    add    r6,pc,#1     #
0x00008d00<+16>:    bx     r6           #
0x00008d04<+20>:    mov    r3,pc        #
0x00008d06<+22>:    adds   r3,#4        # 
0x00008d08<+24>:    push   {r3}         #
0x00008d0a<+26>:    pop    {pc}         #
0x00008d0c<+28>:    pop    {r6}         #
0x00008d10<+32>:    mov    r0,r3        #
0x00008d14<+36>:    sub    sp,r11,#0    #
0x00008d18<+40>:    pop    {r11}        #
0x00008d1c<+44>:    bx     lr           #
  
0x00008d20<+0>:     push  {r11}         #
0x00008d24<+4>:     add   r11,sp,#0     #
0x00008d28<+8>:     mov   r3,lr         #
0x00008d2c<+12>:    mov   r0,r3         #
0x00008d30<+16>:    sub   sp,r11,#0     #
0x00008d34<+20>:    pop   {r11}         #
0x00008d38<+24>:    bx    lr            #
