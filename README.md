## Authors: 112321025陳芊妤
## Input/Output unit:
8x8 LED 矩陣，劃分成4X4的格子，用0000-1111去編號。<br>
4-bit sw，按下亮燈對應編號。<br>
七段顯示器，前面兩個用來顯示計分，後面兩個用來顯示剩餘時間。<br>
LED 陣列，用來顯示關卡(有三關)並且計分。

## 功能說明:
開始時為關卡一的紅色地鼠，進入第二關為紫色地鼠，第三關則為白色地鼠，達到預設分數時會進入新關卡並且便不同顏色的地鼠，過完三關後會全部變白色，表示過關。<br>
第一關<br>
<img src="https://github.com/user-attachments/assets/375f4b32-1342-4525-9abb-d33cd1bd5895" width="300"/><br>
第二關<br>
<img src="https://github.com/user-attachments/assets/dfdf5121-bcf3-44b7-9ec4-6937169c0a46" width="300"/><br>
第三關<br>
<img src="https://github.com/user-attachments/assets/0c03a7d1-bb8e-4bd9-b2f1-3afa311be7db" width="300"/><br>
過關<br>
<img src="https://github.com/user-attachments/assets/6f866320-a72a-4fa8-b516-37b9d14bd97f" width="300"/><br>

## 程式模組說明:
module ex1222_1(output [7:0]DATA_R, DATA_G, DATA_B, //紅色燈，綠色燈，藍色燈<br>
output [3:0]COMM,//控制亮燈排數<br>
input CLK,//頻率<br>
output beep, //蜂鳴器叫聲<br>
input [3:0]A,//打地鼠(透過輸入位置打到地鼠)<br>
output [5:0]A_count,//計分<br>
output a,b,c,d,e,f,g, //七段顯示器<br>
input Clear, //時間清空<br>
output [1:0]level,// 關卡等級<br>
output [3:0]an//控制時間輸出位置<br>
);<br>
module divfreq (input CLK, output reg CLK_div); // 除頻器<br>
module freq(input CLK, output reg CLK_div1); //產生頻率<br>
module count2//倒數計時器結合記分板

## 請說明各 I/O 變數接到哪個 FPGA I/O 裝置
[7:0]DATA_R, DATA_G, DATA_B,[3:0]COMM ->接到8X8全彩點矩陣<br>
beep ->接到BEEP<br>
[3:0]A ->接到4 BITS SW<br>
[5:0]A_count ->接到16-bits LED(LED11-16)<br>
[1:0]level ->接到16-bits LED(LED1-2)<br>
a,b,c,d,e,f,g ->接到7 SEG X4(七段顯示器)<br>
[3:0]an ->接到7 SEG X4<br>
Clear ->接到8DIPSW

## 請加強說明程式邏輯
先定義好16個不同位置的地鼠，用cnt2從16個中隨機顯示，當input的4 BITS SW對應到該位置，8X8LED全滅，蜂鳴器發出聲音。當到達預設分數時，進入下一關，地鼠改變顏色，擊中後所加的分數也會不同，直到達到過關分數後，8X8LED會全亮，代表過關。

## Demo video: (請將影片放到雲端空間)
<a href="https://github.com/user-attachments/assets/8c6594c9-3958-4d20-a445-d13570a2c559" width="500"/></a>

