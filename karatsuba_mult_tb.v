`timescale 1ns / 1ps

module karatsuba_mult_tb;

    // Inputs
    reg [7:0] x, y;

    // Output
    wire [15:0] out;

    // Instantiate the module under test (UUT)
    karatsuba_mult_8 uut (
        .x(x),
        .y(y),
        .out(out)
    );

    initial begin
        // Apply test cases
        x = 8'b00000000; y = 8'b00000000; #10; 
        x = 8'b01111001; y = 8'b10000001; #10; 
        x = 8'b00000010; y = 8'b01010001; #10; 
        x = 8'b00110000; y = 8'b00001011; #10; 
        x = 8'b00001000; y = 8'b00000010; #10; 
        x = 8'b11111111; y = 8'b11111111; #10;

        // End simulation
        $stop;
    end

endmodule
