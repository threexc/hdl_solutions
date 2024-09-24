// This problem is deceptively simple as described on the website - it's
// essentially identical to the module_adder1 solution, except you need
// to define the add1 module as well.
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire wire1, wire2;
    add16 adder1 ( a[15:0], b[15:0], 0, sum[15:0], wire1 );
    add16 adder2 ( a[31:16], b[31:16], wire1, sum[31:16], wire2 );

endmodule

module add1 ( input a, input b, input cin, output sum, output cout );

    assign sum = a ^ b ^ cin;
    assign cout = a & b | a & cin | b & cin;

endmodule
