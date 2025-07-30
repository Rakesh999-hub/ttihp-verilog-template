# Braun Array Multiplier – TinyTapeout Submission

![GDS Layout](https://rakesh999-hub.github.io/ttihp-verilog-template/tt.gds.png)

This project implements an **8-bit × 8-bit Braun Array Multiplier** using Verilog. It is designed and tested for submission through the [TinyTapeout](https://tinytapeout.com/) flow and is fully open-source.

---

## 🧠 Overview

The Braun multiplier is a combinational circuit that performs unsigned binary multiplication using a structured array of full and half adders. It takes two 8-bit inputs and generates a 16-bit product.

- **Inputs**: `A` (8-bit), `B` (8-bit)
- **Output**: `P` (16-bit product)
- **Implemented in**: `braunmul.v`
- **Top module**: `tt_um_example.v`

---

## 🚀 How it works

This design uses:
- A regular array of **AND gates** to generate partial products
- An array of **full and half adders** to compute the final result
- Inputs are provided via `ui_in` and `uio_in`
- Output is split across `uo_out` and `uio_out`

The core logic is defined in the `braunmul.v` module and wrapped for TinyTapeout in `tt_um_example.v`.

---

## ✅ Test Status

- ✅ **Simulation passed** using Cocotb
- ✅ **GDS generated** successfully
- ✅ **Documentation** and info.yaml configured
- ✅ **Live GitHub Pages deployed**

🔗 View test output and logs:  
[GitHub Actions Runs](https://github.com/Rakesh999-hub/ttihp-verilog-template/actions)

---

## 📦 Files

| File                  | Description                                  |
|-----------------------|----------------------------------------------|
| `braunmul.v`          | Main multiplier logic                        |
| `tt_um_example.v`     | Top-level wrapper for TinyTapeout            |
| `test/test_project.py`| Cocotb testbench for simulation              |
| `info.yaml`           | Metadata required by TinyTapeout             |
| `docs/info.md`        | Datasheet details for GitHub Pages           |
| `runs/`               | GDS, render, test logs, etc.                 |

---

## 🖼️ Rendered Layout

You can view the GDS render [here (PNG)](https://rakesh999-hub.github.io/ttihp-verilog-template/tt.gds.png)

---

## 🔗 Useful Links

- [🧠 GitHub Pages site](https://rakesh999-hub.github.io/ttihp-verilog-template/)
- [📦 GitHub Repository](https://github.com/Rakesh999-hub/ttihp-verilog-template)
- [💡 TinyTapeout Docs](https://tinytapeout.com/)

---

## 👨‍💻 Author

**Rakesh Somayajula**  
Submitted as part of the open-source TinyTapeout project.  
Feel free to fork, clone, and learn!

---

## 📜 License

This project is open-source under the MIT License.
