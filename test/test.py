# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0


import cocotb
from cocotb.triggers import RisingEdge
from cocotb.clock import Clock

@cocotb.test()
async def test_project(dut):
    """Test 8x8 Braun Array Multiplier"""
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())

    dut.rst_n.value = 0
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    dut.rst_n.value = 1

    A = 15
    B = 10
    dut.ui_in.value = A
    dut.uio_in.value = B

    for _ in range(10):
        await RisingEdge(dut.clk)

    result = (dut.uo_out.value.integer & 0xFF) | ((dut.uio_out.value.integer & 0xFF) << 8)
    expected = A * B
    assert result == expected, f"Expected {expected}, got {result}"


    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
