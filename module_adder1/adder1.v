module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    // we need two wires to handle the cout and cin values. adder1 can take 0 as the cin value.
    // the cout from adder1 has to go to adder2's cin, so assign that cout to wire1 and pass it
    // to adder2 as the cin value. Then, use wire2 to store cout from adder2
    wire wire1, wire2;
    add16 adder1 ( a[15:0], b[15:0], 0, sum[15:0], wire1 );
    add16 adder2 ( a[31:16], b[31:16], wire1, sum[31:16], wire2 );

endmodule
