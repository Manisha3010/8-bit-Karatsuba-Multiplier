# 8-bit-Karatsuba-Multiplier
Verilog implementation of an 8-bit Karatsuba multiplier.

The Karatsuba algorithm is an efficient multiplication method based on the divide-and-conquer approach, which reduces the number of partial products compared to traditional multiplication techniques.

Let the given numbers be X and Y. For two n-bit numbers X and Y, the Karatsuba algorithm divides them into two halves:

X =  Xl*2^(n/2) + Xr    [Xl and Xr contain leftmost and rightmost n/2 bits of X]
Y =  Yl*2^(n/2) + Yr    [Yl and Yr contain leftmost and rightmost n/2 bits of Y]

The product XY can be written as follows. 

XY = (Xl*2^(n/2) + Xr)(Yl*2^(n/2) + Yr)
   = 2^n(XlYl) + 2n/2(XlYr + XrYl) + XrYr
   = (XlYl)<<n + (XlYr + XrYl)<<n/2 + XrYr

**Tool**: Xilinx Vivado (or any Verilog simulator of your choice)

1. Create a New Project
  Open Xilinx Vivado.
  Click on "Create Project" from the welcome screen.
  Click Next, and enter a suitable Project Name (e.g., Karatsuba_8bit).
  Choose the Project Location where you want to save your project.
  Select "RTL Project", and ensure "Do not specify sources at this time" is checked, then click Next.
  Select your FPGA device by:
  Choosing "Parts", and select the device you are targeting (e.g., xc7a35tcpg236-1 for Artix-7).
  Alternatively, select "Boards", if you're using a specific development board.
  Click Next and then Finish.

2. Add Verilog Source Files
  In the Vivado Flow Navigator, under Project Manager, click "Add Sources".
  Select "Add Sources", select "Add or Create Design Sources", and add - [karatsuba_mult_8.v](karatsuba_mult_8.v) from the repository root.
  Click OK, then Finish, and the file will be added to the project.

3. Add Testbench Files
  In the Vivado Flow Navigator, under Project Manager, click "Add Sources" again.
  Choose "Add or Create Simulation Sources", then click Next.
  Click "Add Sources", select "Add or Create Simulation Sources", and add [karatsuba_mult_tb.v](karatsuba_mult_tb.v) from the root directory.
  Click OK, then Finish, and the testbench files will be added.

4. Run Simulation
  In the Vivado Flow Navigator, go to "Simulation" > "Run Simulation" > "Run Behavioral Simulation".

5. Synthesize the Design
  In the Vivado Flow Navigator, click "Run Synthesis" under the Synthesis section.
  Wait for the synthesis process to complete.
  After completion, review the synthesis report for:
  Resource utilization (LUTs, FFs, DSPs, etc.).
  Timing analysis results.
  If any warnings or errors are present, address them and rerun synthesis.

