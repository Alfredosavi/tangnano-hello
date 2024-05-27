module top (
	input clk,
	input rst,
	output reg [`LEDS_NR-1:0] led
);

	reg [23:0] counter;
	reg clkdiv;

  parameter timecounter = 24'd224_9999;

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			counter 	<= 24'd0;
			clkdiv 	<=  1'd0;
		end else begin
			if (counter == timecounter) begin
				counter <= 24'd0;
				clkdiv <= ~clkdiv;
			end else begin
				counter <= counter + 1;
			end
		end
	end
  
  blink u1 (.clk(clkdiv), .rst(rst), .leds(led));
endmodule

