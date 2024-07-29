# Constant Matrix Multiplication Algorithm for Convolutional Neural Networks

This repository contains resources for implementing and testing a Constant Matrix Multiplication (CMM) algorithm tailored for Convolutional Neural Networks (CNNs). The project is organized into three Jupyter notebooks, each addressing a different aspect of the CMM algorithm and its implementation.

## Notebooks

### 1. PyTorch Implementation

**Description:**
This notebook demonstrates the training and evaluation of a neural network using the Brevitas library in PyTorch. The Brevitas library is used to quantize neural networks, and this notebook showcases how the CMM algorithm integrates with PyTorch for efficient training and evaluation.

**Key Features:**
- Definition of the neural network architecture
- Implementation of the CMM algorithm in PyTorch
- Training and evaluation using the Brevitas library
- Performance metrics and visualization

**File:** `pytorch_implementation.ipynb`

---

### 2. Verilog Code Generation

**Description:**
This notebook focuses on generating Verilog code using the Constant Matrix Multiplication (CMM) algorithm. The generated Verilog code is intended for hardware implementation of the CMM algorithm, which can be used for further FPGA-based projects or hardware acceleration.

**Key Features:**
- Explanation of the CMM algorithm
- Step-by-step process for generating Verilog code
- Integration of the CMM algorithm into hardware description language (HDL)

**File:** `verilogGeneration.ipynb`

---

### 3. Verilog Test

**Description:**
This notebook is designed to compare the output of the Verilog code generated in the previous notebook with the results obtained from PyTorch. The comparison is conducted using Vivado, a popular FPGA design suite, to ensure that the Verilog implementation is consistent with the PyTorch results.

**Key Features:**
- Setup and execution of Vivado tests
- Comparison of Vivado output with PyTorch results
- Analysis and verification of consistency between hardware and software implementations

**File:** `verilogTest.ipynb`

---

## Getting Started

To get started with the repository:

1. Clone the repository:
   ```bash
   git clone https://github.com/CoderZIE/CMM
