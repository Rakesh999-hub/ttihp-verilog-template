<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->
# 8x8 Braun Array Multiplier

## What it does

This project implements an 8x8 Braun array multiplier. It accepts two 8-bit unsigned inputs and outputs a 16-bit product.

## How it works

The design uses the Braun multiplier architecture, which consists of an array of AND gates followed by adders to compute partial products. Each bit of input A is ANDed with every bit of input B to form partial products, and then they are added column-wise using half adders and full adders.

The 16-bit product is split across two outputs:
- The lower 8 bits (P[7:0]) go to `uo_out`
- The upper 8 bits (P[15:8]) go to `uio_out`

Inputs:
- `ui_in`  → Represents operand A
- `uio_in` → Represents operand B

## How to test

The testbench applies different input combinations to `ui_in` and `uio_in`, waits for the result, and compares the output with the expected multiplication result.

### Example:
- If A = 15 (binary: 00001111) and B = 10 (binary: 00001010)
- Then P = 150 (binary: 0000000010010110)
- You will see lower 8 bits on `uo_out`, and upper 8 bits on `uio_out`

## External hardware

None. This project does not require any external hardware or PMODs.
