`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/


module braunmul_tb;

  reg [7:0] A;
  reg [7:0] B;
  wire [15:0] P;

  // DUT: wrapper module for TinyTapeout
  tt_um_example uut (
    .ui_in(A),          // A input
    .uio_in(B),         // B input
    .uo_out(P[7:0]),    // Lower 8 bits of result
    .uio_out(P[15:8]),  // Upper 8 bits of result
    .uio_oe(),          // Not used in test
    .ena(1'b1),         // Always enabled
    .clk(1'b0),         // Not used
    .rst_n(1'b1)        // Not used
  );

  task run_test;
    input [7:0] a_val;
    input [7:0] b_val;
    reg [15:0] expected;
    begin
      A = a_val;
      B = b_val;
      expected = a_val * b_val;

      #10;

      $display("A = %d (%b), B = %d (%b) => P = %d (%b), Expected = %d", 
        A, A, B, B, P, P, expected);

      if (P !== expected)
        $display("❌ Test failed: Got %d, Expected %d", P, expected);
      else
        $display("✅ Test passed!");
    end
  endtask

  initial begin
    $display("=== 8x8 Braun Multiplier via tt_um_example ===");

    run_test(8'd0,   8'd0);
    run_test(8'd1,   8'd1);
    run_test(8'd15,  8'd13);
    run_test(8'd255, 8'd1);
    run_test(8'd255, 8'd255);
    run_test(8'd128, 8'd2);
    run_test(8'd10,  8'd20);

    $display("=== All tests completed ===");
    $finish;
  end

endmodule

