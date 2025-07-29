`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/



module tb;

  reg clk;
  reg rst_n;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  // DUT Instantiation
  tt_um_example dut (
    .clk(clk),
    .rst_n(rst_n),
    .ui_in(ui_in),
    .uio_in(uio_in),
    .uo_out(uo_out),
    .uio_out(uio_out),
    .uio_oe(uio_oe),
    .ena(1'b1)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst_n = 0; ui_in = 0; uio_in = 0;
    #20 rst_n = 1;

    ui_in = 8'd15;
    uio_in = 8'd10;
    #20;

   $display("A = %d, B = %d, Output = %d", ui_in, uio_in, {uio_out, uo_out});

    // $finish;
  end

endmodule
