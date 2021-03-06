module ex2
(
	input [1:0] KEY, //keys
	output [9:0] LED, //leds for MAX 10
	//[11:0] for Cyclone IV
	output [47:0] HEX //displays
);
genvar i;
generate
		for (i=0; i<9; i=i+2) //for MAX 10
		//i<11 for Cyclone IV
		begin: gen
			assign LED[i]=~KEY[1];
	end
endgenerate
genvar j;
generate
	for (j=0; j<6; j=j+1)
	begin: gen2
		case(j)
		0: assign HEX[4]=~KEY[0],
			HEX[5]=~KEY[0],
			HEX[7]=~KEY[0];
		1: assign HEX[4+j*8]=~KEY[0],
			HEX[7+j*8]=~KEY[0];
		2: assign HEX[4+j*8]=~KEY[0],
			HEX[5+j*8]=~KEY[0];
		3: assign HEX[6+j*8]=~KEY[0],
			HEX[7+j*8]=~KEY[0];
		4: assign HEX[6+j*8]=~KEY[0];
		5: assign HEX[2+j*8]=~KEY[0],
			HEX[5+j*8]=~KEY[0],
			HEX[7+j*8]=~KEY[0];
		endcase
	end
endgenerate
endmodule