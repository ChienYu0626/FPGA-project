module ex1222_1(output [7:0]DATA_R, DATA_G, DATA_B, output [3:0]COMM, input CLK, output beep, input [3:0]A,output [5:0]A_count
						,output a,b,c,d,e,f,g, input Clear, output [1:0]level, output [3:0]an
);
  logic [7:0] H_Char [7:0] =
 '{8'b11111111,
   8'b11001111,
	8'b10111011,
	8'b10111111,
	8'b10111111,
	8'b10111011,
	8'b11001111,
	8'b11111111};
	bit [2:0] cnt;
	bit [3:0] cnt2;
	bit [3:0] cnt3;
	byte check_sw;
	byte flag;
	divfreq F0(CLK, CLK_div);
	freq(CLK,CLK_div1);
	count2(A_count,CLK,Clear, a,b,c,d,e,f,g,an[3:0]);
	initial 
		begin
			cnt = 0;
			cnt2 = 0;
			cnt3 = 0;
			DATA_R = 8'b11111111;
			DATA_G = 8'b11111111;
			DATA_B = 8'b11111111;
			COMM = 4'b1000; //which col light
			beep <= 0;
			A_count = 6'b111111;
			level = 2'b01;
		end
	always @(posedge CLK_div)//CLK_div -> 1kHz
		begin
			if(cnt >= 7) // cnt -> 0~7
				cnt = 0;
			else
				cnt = cnt+1;
				COMM = {1'b1 ,cnt};
				DATA_R = H_Char[cnt];
				if(A_count <= 6'b001000)begin
					level <= 2'b01;
				end
				if(A_count >= 6'b001000)begin
					DATA_B = H_Char[cnt];
					level <= 2'b10;
				end
				if(A_count >= 6'b010100)begin
					DATA_G = H_Char[cnt];
					level <= 2'b11;
				end
				if(A_count == 6'b011101)begin
					DATA_R = 8'b00000000;
					DATA_G = 8'b00000000;
					DATA_B = 8'b00000000;
				end
		end
		
			always @(posedge CLK_div1)      
		begin
			cnt2 = (cnt2*5+3) % 16;
			if(cnt2 == 0)
				begin
					H_Char <=
					'{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b00111111,
						8'b00111111};
					check_sw <=0;
					beep <= 0;
				end
			else if(cnt2 == 1)
				begin
					H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b00111111,
						8'b00111111,
						8'b11111111,
						8'b11111111};
					check_sw <=1;
					beep <= 0;
				end
			else if(cnt2 == 2)
				begin
					H_Char <=
					'{8'b11111111,
						8'b11111111,
						8'b00111111,
						8'b00111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=2;
					beep <= 0;
				end	
			else if(cnt2 == 3)
				  begin
						H_Char <=
						'{8'b00111111,
						8'b00111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=3;
					beep <= 0;
				  end	
			  else if(cnt2 == 4)
				  begin
						H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11001111,
						8'b11001111};
					check_sw <=4;
					beep <= 0;
				  end
			  else if(cnt2 == 5)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11001111,
						8'b11001111,
						8'b11111111,
						8'b11111111};
					check_sw <=5;
					beep <= 0;
				  end
			  else if(cnt2 == 6)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11001111,
						8'b11001111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=6;
					beep <= 0;
				  end
			  else if(cnt2 == 7)
				  begin
				  H_Char <=
					 '{8'b11001111,
						8'b11001111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=7;
					beep <= 0;
				  end
			  else if(cnt2 == 8)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11110011,
						8'b11110011};
					check_sw <=8;
					beep <= 0;
				  end
			  else if(cnt2 == 9)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11110011,
						8'b11110011,
						8'b11111111,
						8'b11111111};
					check_sw <=9;
					beep <= 0;
				  end
			  else if(cnt2 == 10)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11110011,
						8'b11110011,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=10;
					beep <= 0;
				  end		  
			  else if(cnt2 == 11)
				  begin
				  H_Char <=
					 '{8'b11110011,
						8'b11110011,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=11;
					beep <= 0;
				  end		  
			  else if(cnt2 == 12)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111100,
						8'b11111100};
					check_sw <=12;
					beep <= 0;
				  end		  
			  else if(cnt2 == 13)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111100,
						8'b11111100,
						8'b11111111,
						8'b11111111};
					check_sw <=13;
					beep <= 0;
				  end		  
			  else if(cnt2 == 14)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111100,
						8'b11111100,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=14;
					beep <= 0;
				  end		  
			  else if(cnt2 == 15)
				  begin
				  H_Char <=
					 '{8'b11111100,
						8'b11111100,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=15;
					beep <= 0;
				  end	
			if (check_sw == 1)
					begin
						if (A==4'b0001)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 0)
					begin
						if (A==4'b0000)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 2)
					begin
						if (A==4'b0010)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 3)
					begin
						if (A==4'b0011)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 4)
					begin
						if (A==4'b0100)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 5)
					begin
						if (A==4'b0101)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								A_count <= A_count + 1'b1;
							end
						else;
					end
				else if  (check_sw == 6)
					begin
						if (A==4'b0110)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 7)
					begin
						if (A==4'b0111)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 8)
					begin
						if (A==4'b1000)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 9)
					begin
						if (A==4'b1001)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 10)
					begin
						if (A==4'b1010)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 11)
					begin
						if (A==4'b1011)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 12)
					begin
						if (A==4'b1100)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 13)
					begin
						if (A==4'b1101)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 14)
					begin
						if (A==4'b1110)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 15)
					begin
						if (A==4'b1111)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
					end
				else;	 
			
			end
endmodule

module divfreq (input CLK, output reg CLK_div);
reg [24:0] Count;
always @(posedge CLK)
 begin
  if (Count > 25000)//HZ
   begin
	 Count <= 25'b0;
	 CLK_div <= ~CLK_div;
	end
  else
   Count <= Count + 1'b1;
 end
endmodule

module freq(input CLK, output reg CLK_div1);
		reg [24:0] Count;
		always @(posedge CLK)
			begin
				if(Count > 18000000)
					begin
						Count <= 25'b0;
						CLK_div1 <= ~CLK_div1;
					end
				else
					Count <= Count + 1'b1;
			end
endmodule

module divfreq_t (input CLK, output reg CLK_div);
reg [24:0] Count;
always @(posedge CLK)
 begin
  if (Count > 25000000)
   begin
	 Count <= 25'b0;
	 CLK_div <= ~CLK_div;
	end
  else
   Count <= Count + 1'b1;
 end
endmodule

//7段顯示器
module BCD2Seg(input A,B,C,D, output reg a,b,c,d,e,f,g);
 always @(A,B,C,D)
  case({A,B,C,D})
   4'b0000:{a,b,c,d,e,f,g}= 7'b0000001;
	4'b0001:{a,b,c,d,e,f,g}= 7'b1001111;
	4'b0010:{a,b,c,d,e,f,g}= 7'b0010010;
	4'b0011:{a,b,c,d,e,f,g}= 7'b0000110;
	4'b0100:{a,b,c,d,e,f,g}= 7'b1001100;
	4'b0101:{a,b,c,d,e,f,g}= 7'b0100100;
	4'b0110:{a,b,c,d,e,f,g}= 7'b0100000;
	4'b0111:{a,b,c,d,e,f,g}= 7'b0001111;
	4'b1000:{a,b,c,d,e,f,g}= 7'b0000000;
	4'b1001:{a,b,c,d,e,f,g}= 7'b0000100;
	default:{a,b,c,d,e,f,g}= 7'b1111111;
  endcase
endmodule

//計分計時
module count2(
	 input [5:0] A_count,  // 計分的輸入
	 input clock,
    input reset,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output [3:0]an
    );
  
reg [3:0]first; //register for the first digit
reg [3:0]second; //register for the second digit
reg [25:0] delay; //register to produce the 0.1 second delay
wire test;

always @ (posedge clock or posedge reset)
 begin
  if (reset)
   delay <= 0;
  else
   delay <= delay + 1;
 end
 
assign test = &delay; //AND each bit of delay with itself; test will be high only when all bits of delay are high

always @ (posedge test or posedge reset)
	 begin
	  if (reset) begin
		first <= 9;//1
		second <= 9;//10
	  end
	  
		else if (first==4'd0) begin  //x9 reached
		 first <= 9;
		  if (second == 4'd0) //99 reached
				second <= 9;
			else
			 second <= second - 1;
		end
		else
		 first <= first - 1;
	end

//Multiplexing circuit below

localparam N = 20;

reg [N-1:0]count;

always @ (posedge clock or posedge reset)
 begin
  if (reset)
   count <= 0;
  else
   count <= count + 1;
 end

reg [6:0] sseg;           // 7段顯示的段碼
reg [3:0] an_temp;        // 顯示位選

always @(*) begin
    case(count[N-1:N-2]) // 根據 count 的高兩位來選擇顯示模式

        // 計時部分 (00 和 01)
        2'b00: begin
            sseg = first;     // 顯示計時的第一個數字
            an_temp = 4'b1110; // 啟用第一個七段顯示器
        end

        2'b01: begin
            sseg = second;    // 顯示計時的第二個數字
            an_temp = 4'b1101; // 啟用第二個七段顯示器
        end

        // 計分部分 (10 和 11)
        2'b11: begin
            sseg = (A_count / 10) % 10; // 顯示計分的十位數
            an_temp = 4'b0111;          // 啟用第三個七段顯示器
        end

        2'b10: begin
            sseg = A_count % 10; // 顯示計分的個位數
            an_temp = 4'b1011;    // 啟用第四個七段顯示器
        end

    endcase
end

assign an = an_temp;  // 設定顯示位選

reg [6:0] sseg_temp;  // 可選用的暫存變數

always @ (*)
 begin
  case(sseg)
   4'd0 : sseg_temp = 7'b1000000; //0
   4'd1 : sseg_temp = 7'b1111001; //1
   4'd2 : sseg_temp = 7'b0100100; //2
   4'd3 : sseg_temp = 7'b0110000; //3
   4'd4 : sseg_temp = 7'b0011001; //4
   4'd5 : sseg_temp = 7'b0010010; //5
   4'd6 : sseg_temp = 7'b0000010; //6
   4'd7 : sseg_temp = 7'b1111000; //7
   4'd8 : sseg_temp = 7'b0000000; //8
   4'd9 : sseg_temp = 7'b0010000; //9
   default : sseg_temp = 7'b0111111; //dash
  endcase
 end
assign {g, f, e, d, c, b, a} = sseg_temp; 
endmodule
