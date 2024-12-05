module Enemy_Stats (
    input [1:0] addr,
    output reg [37:0] out
);
    always @(*) begin
        case (addr)
            2'd0:    out = 38'b00011111010000011001010000100000010100;
            2'd1:    out = 38'b01111101000001100100010100010001010000;
            2'd2:    out = 38'b11111010000011111010011110001000101000;
            default: out = 38'b00000011001001100100000011010001010000;
        endcase
    end
endmodule

module Army_Stats (
    input [2:0] addr,
    output reg [37:0] out
);
    always @(*) begin
        case (addr)
            3'd0:    out = 38'b00001001011000110010010000101000001111;
            3'd1:    out = 38'b00011111010000011001010000011000001010;
            3'd2:    out = 38'b01011101110001001011011111000000000001;
            3'd3:    out = 38'b00011001000001100100010000100001011010;
            3'd4:    out = 38'b00011001000011111010011001010000000101;
            3'd5:    out = 38'b00110010000011001000010100011001011010;
            3'd6:    out = 38'b01011101110011001000010100011101100100;
            default: out = 38'b01111101000011111010010110011001100100;
        endcase
    end
endmodule

module Enemy_Pixel (
    input [1:0] addr,
    output reg [18:0] out   // W[7B][18:12], H[7B][11:5], D[5B][4:0]
);
    always @(*) begin
        case (addr)
            2'd0:    out = 19'b0100000001111011110;
            2'd1:    out = 19'b0100000011110011000;
            2'd2:    out = 19'b0100000010100011100;
            default: out = 19'b0100000011110011000;
        endcase
    end
endmodule

module Army_Pixel (
    input [2:0] addr,
    output reg [18:0] out   // W[7B][18:12], H[7B][11:5], D[5B][4:0]
);
    always @(*) begin
        case (addr)
            3'd0:    out = 19'b0101000010100000010;
            3'd1:    out = 19'b0101000010100000010;
            3'd2:    out = 19'b0100000001100000000;
            3'd3:    out = 19'b0101000010100001100;
            3'd4:    out = 19'b0011110001010000000;
            3'd5:    out = 19'b0101000011001001010;
            3'd6:    out = 19'b0101000011001001010;
            default: out = 19'b1010000011000001000;
        endcase
    end
endmodule

module Purse_Upgrade_Need_Money (
    input [2:0] level,
    output reg [14:0] out
);
    always @(*) begin
        case (level)
            3'd0:    out = 14'd100;
            3'd1:    out = 14'd200;
            3'd2:    out = 14'd400;
            3'd3:    out = 14'd600;
            3'd4:    out = 14'd1000;
            3'd5:    out = 14'd2000;
            3'd6:    out = 14'd4000;
            default: out = 14'd8000;
        endcase
    end
endmodule

module Purse_Max_Money (
    input [2:0] level,
    output reg [14:0] out
);
    always @(*) begin
        case (level)
            3'd0:    out = 14'd100;
            3'd1:    out = 14'd300;
            3'd2:    out = 14'd500;
            3'd3:    out = 14'd1000;
            3'd4:    out = 14'd2000;
            3'd5:    out = 14'd4000;
            3'd6:    out = 14'd6000;
            default: out = 14'd10000;
        endcase
    end
endmodule