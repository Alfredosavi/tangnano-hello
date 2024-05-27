module blink (
	input clk,
	input rst,
	output reg [`LEDS_NR-1:0] leds
);

	initial begin
		leds = {`LEDS_NR{1'b0}};
	end
	

	always @(posedge clk or negedge rst) begin
		if (!rst)
			leds = {`LEDS_NR{1'b0}};
		else
			leds <= ~leds;
	end

endmodule
