module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] a, b, c;
    
    my_dff8 instance1 ( clk, d, a );
    my_dff8 instance2 ( clk, a, b );
    my_dff8 instance3 ( clk, b, c );
    
    // use a double ternary operator, but remember that d is the first
    // input and therefore goes with sel = 0b01
    assign q = sel[1] ? (sel[0] ? c : b) : (sel[0] ? a : d);

    // alternatively, use an always block
    //always @ (*) begin
    //    case(sel)
    //        0 : q = d;
    //        1 : q = a;
    //        2 : q = b;
    //        3 : q = c;
    //    endcase
    //end
endmodule
