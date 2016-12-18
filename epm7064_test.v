module epm7064_test(clk, audio);
input wire clk;
output audio;
			
		  
reg [15:0] counter; initial counter <= 16'd0;

reg [27:0] tone; initial tone <= 28'd0;
always @(posedge clk) tone <= tone + 1'b1;

wire [5:0] step_num = tone[26:(26-5)];  // 6 бит это от 0 до 64

wire [2:0] note_num = 
					  (step_num == 0) ? 5 :    // 1
					  (step_num == 1) ? 5 :    // 2
					  (step_num == 2) ? 0 :    // 3
					  (step_num == 3) ? 0 :    // 4
					  (step_num == 4) ? 3 :    // 5
					  (step_num == 5) ? 0 :    // 6
					  (step_num == 6) ? 3 :    // 7
					  (step_num == 7) ? 0 :    // 8
					  (step_num == 8) ? 5 :    // 9
					  (step_num == 9) ? 5 :    // 10
					  (step_num ==10) ? 0 :    // 11
					  (step_num ==11) ? 0 :    // 12
					  (step_num ==12) ? 3 :    // 13
					  (step_num ==13) ? 0 :    // 14
					  (step_num ==14) ? 3 :    // 15
					  (step_num ==15) ? 0 :    // 16
					  
					  (step_num ==16) ? 5 :    // 17
					  (step_num ==17) ? 0 :    // 18
					  (step_num ==18) ? 4 :    // 19
					  (step_num ==19) ? 0 :    // 20
					  (step_num ==20) ? 3 :    // 21
					  (step_num ==21) ? 0 :    // 22
					  (step_num ==22) ? 2 :    // 23
					  (step_num ==23) ? 0 :    // 24
					  (step_num ==24) ? 1 :    // 25
					  (step_num ==25) ? 1 :    // 26
					  (step_num ==26) ? 1 :    // 27
					  (step_num ==27) ? 1 :    // 28
					  (step_num ==28) ? 0 :    // 29
					  (step_num ==29) ? 0 :    // 30
					  (step_num ==30) ? 0 :    // 31
					  (step_num ==31) ? 0 :    // 32
					  
					  (step_num ==32) ? 6 :    // 33
					  (step_num ==33) ? 6 :    // 34
					  (step_num ==34) ? 0 :    // 35
					  (step_num ==35) ? 0 :    // 36
					  (step_num ==36) ? 7 :    // 37
					  (step_num ==37) ? 0 :    // 38
					  (step_num ==38) ? 6 :    // 39
					  (step_num ==39) ? 0 :    // 40
					  (step_num ==40) ? 5 :    // 41
					  (step_num ==41) ? 5 :    // 42
					  (step_num ==42) ? 0 :    // 43
					  (step_num ==43) ? 0 :    // 44
					  (step_num ==44) ? 3 :    // 45
					  (step_num ==45) ? 0 :    // 46
					  (step_num ==46) ? 3 :    // 47
					  (step_num ==47) ? 0 :    // 48

					  (step_num ==48) ? 5 :    // 49
					  (step_num ==49) ? 0 :    // 50
					  (step_num ==50) ? 4 :    // 51
					  (step_num ==51) ? 0 :    // 52
					  (step_num ==52) ? 3 :    // 53
					  (step_num ==53) ? 0 :    // 54
					  (step_num ==54) ? 2 :    // 55
					  (step_num ==55) ? 0 :    // 56
					  (step_num ==56) ? 1 :    // 57
					  (step_num ==57) ? 1 :    // 58
					  (step_num ==58) ? 1 :    // 59
					  (step_num ==59) ? 1 :    // 60
					  (step_num ==60) ? 0 :    // 61
					  (step_num ==61) ? 0 :    // 62
					  (step_num ==62) ? 0 :    // 63
					  (step_num ==63) ? 0 :    // 64

					   0;


wire [15:0] clkdivider = 
						 (note_num == 0) ? 16'd0 :
						 (note_num == 1) ? 16'b1011101111110000 :
						 (note_num == 2) ? 16'b1010011101110000 :
						 (note_num == 3) ? 16'b1001010100110000 :
						 (note_num == 4) ? 16'b1000110011010000 :
						 (note_num == 5) ? 16'b0111110101110000 :
						 (note_num == 6) ? 16'b0110111111000000 :
						 (note_num == 7) ? 16'b0101111000000000 : 16'd0;

always @(posedge clk) begin
	if(counter==0) begin
		counter <= clkdivider;
	end else begin
		counter <= counter - 1'b1;
	end
end

reg audio;
always @(posedge clk) if(counter==0) audio <= ~audio;

endmodule
