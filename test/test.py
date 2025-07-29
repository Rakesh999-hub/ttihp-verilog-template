# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0


   import cocotb
from cocotb.triggers import Timer
from cocotb.result import TestFailure

@cocotb.test()
async def test_project(dut):
    """Test the 8x8 Braun Multiplier via tt_um_example wrapper"""
    
    A = 15
    B = 10

    dut.ui_in.value = A
    dut.uio_in.value = B

    await Timer(10, units="ns")

    # Read 16-bit product from output (8 lower bits + 8 upper bits)
    product_low = dut.uo_out.value.integer
    product_high = dut.uio_out.value.integer
    result = (product_high << 8) | product_low

    expected = A * B

    dut._log.info(f"A={A}, B={B}, Result={result}, Expected={expected}")

    if result != expected:
        raise TestFailure(f"Output mismatch: got {result}, expected {expected}")


    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
