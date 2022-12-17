# leg
![leg_c](https://user-images.githubusercontent.com/107084512/208231173-4b5ce66e-4427-4266-844f-1665a290dd1b.png)
c코드를 보면 중간에 pc라는 것을 볼 수 있다. 구글링해서 찾아본 결과 pc는 EIP처럼 현재 수행하고 있는 주소값을 알려주는 레지스터이다.
정확한 값을 알기 위해서는 주어진 leg.asm 어셈블리 파일을 통해서 주소값을 확인해야한다고 생각했다.

![leg_main](https://user-images.githubusercontent.com/107084512/208231175-c0368c52-13ea-47ac-ba8a-9b74164fbaea.png)

![leg_key](https://user-images.githubusercontent.com/107084512/208231183-49f7fe6a-ee58-413d-96b3-d38f6a41e836.png)


솔루션: leg.c파일을 컴파일하고 gdb로 key1(),key2(),key3() 값을 알아내고 실행해서 key값에 알맞는 값을 넣어서 답을 구한다.<br>
->오류로 인해 컴파일이 되지않아 실행파일을 구할 수 없음<br>
->서버에 접속해서 실행할 수 있고 leg.asm 파일을 이미 가지고 있어서 leg.asm 파일을 보면서 key값들을 유추할 수 있다.<br>
