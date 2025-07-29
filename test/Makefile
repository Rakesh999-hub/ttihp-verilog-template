# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

SRC_DIR = $(PWD)/../src
PROJECT_SOURCES = project.v

# Simulation build directory
SIM_BUILD = sim_build/rtl

# RTL source files
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))

# Include path for shared headers if needed
COMPILE_ARGS += -I$(SRC_DIR)

# Include the testbench
VERILOG_SOURCES += $(PWD)/tb.v
TOPLEVEL = tb

# Python test file (without .py extension)
MODULE = test

# Include cocotb simulation rules
include $(shell cocotb-config --makefiles)/Makefile.sim


