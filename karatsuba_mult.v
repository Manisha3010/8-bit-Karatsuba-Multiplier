`timescale 1ns / 1ps

module karatsuba_mult(
    input [1:0] x, y,
    output [4:0] out   
);

    wire xl, xr, yl, yr;
    wire [1:0] p1, p2, p4, p3;
    wire [2:0] sum;


    // Divide the inputs into high and low bits
    assign xr = x[0];
    assign xl = x[1];
    assign yr = y[0];
    assign yl = y[1];

    // Partial multiplications
    assign p1 = xl & yl;
    assign p2 = xr & yr;
    assign p3 = xl & yr;
    assign p4 = xr & yl;
    
    assign sum = p3+p4;
    
    assign out = (p1 << 2) + (sum << 1) +p2;

endmodule

module karatsuba_mult_4(
    input [3:0] x, y,
    output [8:0] out  
);

    wire [1:0] xl, xr, yl, yr;
    wire [4:0] p1, p2, p4, p3;
    wire [5:0] sum;

    // Divide the inputs into high and low bits
    assign xr = x[1:0];
    assign xl = x[3:2];
    assign yr = y[1:0];
    assign yl = y[3:2];

    // Partial multiplications

    karatsuba_mult m0(.x(xl),.y(yl), .out(p1));
    karatsuba_mult m1(.x(xr), .y(yr), .out(p2));
    karatsuba_mult m2(.x(xl), .y(yr), .out(p3));
    karatsuba_mult m3(.x(xr), .y(yl), .out(p4));
    
    assign sum = p3+p4;
    
    assign out = (p1 << 4) + (sum << 2) + p2;

endmodule

module karatsuba_mult_8(
    input [7:0] x, y,
    output [15:0] out  
);

    wire [3:0] xl, xr, yl, yr;
    wire [8:0] p1, p2, p3, p4;
    wire [9:0] sum;
   

    // Divide the inputs into high and low bits
    assign xr = x[3:0];
    assign xl = x[7:4];
    assign yr = y[3:0];
    assign yl = y[7:4];

    // Partial multiplications
    karatsuba_mult_4 m4(.x(xl),.y(yl), .out(p1));
    karatsuba_mult_4 m5(.x(xr), .y(yr), .out(p2));
    karatsuba_mult_4 m6(.x(xl), .y(yr), .out(p3));
    karatsuba_mult_4 m7(.x(xr), .y(yl), .out(p4));
    
    assign sum = p3+p4;
    
    assign out = (p1 << 8) + (sum << 4) + p2;

endmodule
