# leg
![leg_c](https://user-images.githubusercontent.com/107084512/208231173-4b5ce66e-4427-4266-844f-1665a290dd1b.png)
c코드를 보면 중간에 pc라는 것을 볼 수 있다. 구글링해서 찾아본 결과 pc는 EIP처럼 현재 수행하고 있는 주소값을 알려주는 레지스터이다.<br>
정확한 값을 알기 위해서는 주어진 leg.asm 어셈블리 파일을 통해서 주소값을 확인해야한다고 생각했다.<br>

![leg_main](https://user-images.githubusercontent.com/107084512/208231175-c0368c52-13ea-47ac-ba8a-9b74164fbaea.png)

![leg_key](https://user-images.githubusercontent.com/107084512/208231183-49f7fe6a-ee58-413d-96b3-d38f6a41e836.png)


솔루션: leg.c파일을 컴파일하고 gdb로 key1(),key2(),key3() 값을 알아내고 실행해서 key값에 알맞는 값을 넣어서 답을 구한다.<br>
->오류로 인해 컴파일이 되지않아 실행파일을 구할 수 없음<br>
->서버에 접속해서 실행할 수 있고 leg.asm 파일을 이미 가지고 있어서 leg.asm 파일을 보면서 key값들을 유추할 수 있다.<br>

<pre>
<main>
0x00008d3c<+0>:     push  {r4,r11,lr}                   # r4,r11,lr 를 push 한다.
0x00008d40<+4>:     add   r11,sp,#8                     # r11=sp+8
0x00008d44<+8>:     sub   sp,sp,#12                     # sp=sp-12
0x00008d48<+12>:    mov   r3,#0                         # r3=0
0x00008d4c<+16>:    str   r3,[r11,#-16]                 #
0x00008d50<+20>:    ldr   r0,[pc,#104]                  #
0x00008d54<+24>:    bl    0xfbbc <printf>                       # printf 함수를 call 한다
0x00008d58<+28>:    sub   r3,r11,#16                    # r3 = r11 - 16
0x00008d5c<+32>:    ldr   r0,[pc,#96]                   # 
0x00008d60<+36>:    mov   r1,r3                         # r1 = r3
0x00008d64<+40>:    bl    0xfbd8  <__isoc99_scanf>      # scanf 함수를 call 한다
0x00008d68<+44>:    bl    0x8cd4  <key1>                      # key1 함수를 call 한다
0x00008d6c<+48>:    mov   r4,r0                         # key1 함수에서의 r0값을 r4로 옮긴다.
0x00008d70<+52>:    bl    0x8cf0  <key2>                      # key2 함수를 call 한다
0x00008d74<+56>:    mov   r3,r0                         # key2 함수에서의 r0값을 r3로 옮긴다.
0x00008d78<+60>:    add   r4,r4,r3                      # r4 = r4 + r3  
0x00008d7c<+64>:    bl    0x8cf0  <key3>                      # key3 함수를 호출한다.
0x00008d80<+68>:    mov   r3,r0                         # r3 = r0(key3에서 가져온 r0값이다)
0x00008d84<+72>:    add   r2,r4,r3                      # r2 = r3+r4  -> r2는 key1()+key2()+key3() 값을 가진다.
0x00008d88<+76>:    ldr   r3,[r11,#-16]                 #
0x00008d8c<+80>:    cmp   r2,r3                         # r2와 r3를 비교한다. -> leg.c에서 if문에 해당되는 부분이다.
0x00008d90<+84>:    bne   0x8da8  <main + 108>                      #
0x00008d94<+88>:    ldr   r0,[pc,#44]                   #
0x00008d98<+92>:    bl    0x1050c <puts>                      #                
0x00008d9c<+96>:    ldr   r0,[pc,#40]                   #
0x00008da0<+100>:   bl    0xf89c  <system>                      #
0x00008da4<+104>:   b     0x8db0  <main + 116>                      #
0x00008da8<+108>:   ldr   r0,[pc,#32]                   #
0x00008dac<+112>:   bl    0x1050c <puts>                      #
0x00008db0<+116>:   mov   r3,#0                         #
0x00008db4<+120>:   mov   r0,r3                         #
0x00008db8<+124>:   sub   sp,r11,#8                     #
0x00008dbc<+128>:   pop   {r4,r11,pc}                   #
0x00008dc0<+132>:   andeq r10,r6,,r12,lsl,#9            #


<key1>
0x00008cd4<+0>:     push  {r11}         # 레지스터 r11을 push한다.
0x00008cd8<+4>:     add   r11,sp,#0     # r11 = sp(0x00008cd8) + 0
0x00008cdc<+8>:     mov   r3,pc         # r3=pc(0x00008cdc) **pc는 어느 주소를 가져오는 것인가
0x00008ce0<+12>:    mov   r0,r3         # r0=r3(0x00008cdc)
0x00008ce4<+16>:    sub   sp,r11,#0     # sp= r11 - 0 
0x00008ce8<+20>:    pop   {r11}         # r11(0x00007cd8)을 pop(빼낸다)
0x00008cec<+24>:    bx    lr            # 원래 함수로 돌아간다.


<key2>
0x00008cf0<+0>:     push  {r11}           # r11 레지스터를 넣는다
0x00008cf4<+4>:     add    r11,sp,#0      # r11 = sp + 0
0x00008cf8<+8>:     push   {r6}           # r6 레지스터를 넣는다
0x00008cfc<+12>:    add    r6,pc,#1       # r6 = pc + 1
0x00008d00<+16>:    bx     r6             # r6 레지스터 주소로 점프를 실행한다.
0x00008d04<+20>:    mov    r3,pc          # r3 = pc
0x00008d06<+22>:    adds   r3,#4          # r3 = r3 + 4
0x00008d08<+24>:    push   {r3}           # r3 레지스터를 넣는다
0x00008d0a<+26>:    pop    {pc}           # pc 레지스터를 뺀다
0x00008d0c<+28>:    pop    {r6}           # r6 레지스터를 뺀다
0x00008d10<+32>:    mov    r0,r3          # r0 = r3
0x00008d14<+36>:    sub    sp,r11,#0      # sp = r11 - 0
0x00008d18<+40>:    pop    {r11}          # r11 레지스터를 뺀다
0x00008d1c<+44>:    bx     lr             # 호출 함수로 되돌아간다.


<key3>
0x00008d20<+0>:     push  {r11}         # r11 레지스터를 넣는다.
0x00008d24<+4>:     add   r11,sp,#0     # r11 = sp + 0
0x00008d28<+8>:     mov   r3,lr         # r3 = lr
0x00008d2c<+12>:    mov   r0,r3         # r0 = r3(lr)
0x00008d30<+16>:    sub   sp,r11,#0     # sp = r11 - 0
0x00008d34<+20>:    pop   {r11}         # r11 레지스터를 뺀다
0x00008d38<+24>:    bx    lr            # 호출 함수로 되돌아간다.
</pre>

각각의 함수에서 r0 값들을 구해서 더해주면 답을 얻을 수 있다. <br>
key1 함수부터 보면 r0은 결국 pc 값을 가지게 된다. 여기서 pc는 0x00008cdc<br>
key2 함수도 r0이 메인 함수에서 key1에서 구한 값과 합하고 나중에 비교할 때 영향을 주기 때문에 r0이 무슨 값을 가지는지 본다.<br>
r3 = pc -> r3 = r3 + 4이기 때문에 r0은 0x00008d04 + 0x4이다.<br>
key3 함수에서는 lr 레지스터로 함수가 돌아갈 주소가 저장된다. r0값은 0x00008d80이다.<br>
key1 + key2 + key3 = 0x00008cdc + 0x00008d08 + 0x00008d80 = 36060 + 36104 + 36224 = 108388했는데 답이 틀려서 뭐가 잘못됐는지 찾아봤다.<br>
찾아보던 중 pc값을 잘못 찾은거 같다고 생각했다. pc는 현재 fetch되고 있는 명령어의 주소 - 따라서 현재 실행되는 명령어의 다음다음 주소라는 것을 알아냈고 <br>
원래 key1함수에서의 pc값은 0x00008cdc가 아닌 0x000008ce4이고 <br>
key2에서느 0x00008d08 + 0x00000004이므로 0x000008d0c이다.<br>
다시 계산하면 0x00008ce4 + 0x00008d0c + 0x00008d80 = 36068 + 36108 + 36224 =108400 으로 정답을 구했다<br>
