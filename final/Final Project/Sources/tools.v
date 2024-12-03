module Clk_Divisor_4 (
    input clk, 
    output out
);
    reg  [1:0] num;
    wire [1:0] next_num;

    always @(posedge clk) num <= next_num;

    assign next_num = num + 1'b1;
    assign out = num[1];
endmodule

module Clk_Divisor_6 (
    input clk, 
    output out
);
    reg  [2:0] num;
    wire [2:0] next_num;

    always @(posedge clk) num <= next_num;

    assign next_num = (out ? 3'd0 : num + 1'b1);
    assign out = (num == 3'd5);
endmodule

module Debounce(clk, pb, pb_d);
    input clk, pb;
    output pb_d;
    reg [8-1:0] DFF;

    assign pb_d = &DFF;
    always @(posedge clk) DFF[7:0] <= {DFF[6:0], pb};
endmodule

module One_Palse (clk, pb_d, pb_1p);
    input clk, pb_d;
    output reg pb_1p;

    reg pb_delay;
    always @(posedge clk) pb_delay <= pb_d;
    always @(posedge clk) pb_1p <= pb_d & ~pb_delay;
endmodule

module Priority_Encoder_8x3 (
    input [7:0] in,
    output reg [2:0] out
);

    always @(*) begin
        casex (in)
            8'bxxxxxxx1: out = 3'b000;
            8'bxxxxxx10: out = 3'b001;
            8'bxxxxx100: out = 3'b010;
            8'bxxxx1000: out = 3'b011;
            8'bxxx10000: out = 3'b100;
            8'bxx100000: out = 3'b101;
            8'bx1000000: out = 3'b110;
            8'b10000000: out = 3'b111;
            default:     out = 3'b000;
        endcase
    end
endmodule