// `include "blink.v"
`timescale 1ns/100ps

module blink_tb;
  reg clk_tb, rst_tb;
  wire [`LEDS_NR-1:0] leds_tb;

  // Instance of the blink module
  blink u1 (
    .clk(clk_tb),
    .rst(rst_tb),
    .leds(leds_tb)
  );


  initial begin
    $dumpfile("blink_tb.vcd");
    $dumpvars(0, blink_tb);
    
    $display("TEST BLINK!");


    clk_tb = 0;
    rst_tb = 0; // RESET
    
    #5;
    if (leds_tb != 0) 
      $error("Error: Expected LEDs to be 0, but got %b.", leds_tb);

    rst_tb = 1;
    clk_tb = 1;

    #10;
    if (leds_tb == 0) 
      $error("Error: Expected LEDs to be HIGH, but got %b.", leds_tb);
    
    #4; clk_tb = 0;
    #4; clk_tb = 1;

    #10;
    if (leds_tb != 0) 
      $error("Error: Expected LEDs to be LOW, but got %b.", leds_tb);

    #20;
    $finish;
  end

endmodule
