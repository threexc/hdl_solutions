// this is similar to how we did shift8 and the other adders. A ternary
// operator can be used to conditionally assign the output, although an
// always block is probably more Verilog-esque. The "extra" variable is
// just for storing the cout value of the two add16s that we select
// between, but it isn't used.
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] zero;
    wire [15:0] one;
    wire sel;
    wire extra;
    add16 lower ( a[15:0], b[15:0], 0, sum[15:0], sel );
    add16 cin0 ( a[31:16], b[31:16], 0, zero, extra );
    add16 cin1 ( a[31:16], b[31:16], 1, one, extra );
    
    assign sum[31:16] = sel ? one : zero;

endmodule
