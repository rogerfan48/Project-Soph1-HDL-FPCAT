module Render (
    input rst,
    input pause,
    input clk,
    input clk_25MHz,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [9:0] h_cnt_1,
    input [9:0] h_cnt_2,
    input [9:0] h_cnt_3,
    input [9:0] h_cnt_4,
    input [9:0] h_cnt_5,
    input [9:0] h_cnt_6,
    input [9:0] v_cnt_1,
    input [9:0] v_cnt_2,
    input [9:0] v_cnt_3,
    input [9:0] v_cnt_4,
    input [9:0] v_cnt_5,
    input [9:0] v_cnt_6,
    input [9:0] mouseX,
    input [9:0] mouseY,
    input valid,
    input enable_mouse_display,
    input [11:0] mouse_pixel,
    input [2:0] scene,
    input mouseInStart,
    input mouseInLevel1,
    input mouseInLevel2,
    input mouseInLevel3,
    input [9:0] mouseInFrame,
    input [5:0] towerBlood_E_tr,
    input [5:0] towerBlood_A_tr,
    input [55:0] Enemy_Instance [7:0],
    input [55:0] Army_Instance [7:0],
    input [4:0] genArmyCD [7:0],
    input ableToUpgrade,
    input [14:0] money,
    input [2:0] purse_level,
    input [7:0] tower_cnt,
    input twinkle,
    output reg [3:0] vgaRed,
    output reg [3:0] vgaGreen,
    output reg [3:0] vgaBlue
);

    parameter S_START = 3'd0;
    parameter S_MENU = 3'd1;
    parameter S_PLAY1 = 3'd2;
    parameter S_PLAY2 = 3'd3;
    parameter S_PLAY3 = 3'd4;
    parameter S_WIN = 3'd5;
    parameter S_LOSE = 3'd6;

    wire [11:0] pixel_start;
    Render_Start Render_Start (rst, clk, clk_25MHz, h_cnt, v_cnt,
        h_cnt_1, h_cnt_2, h_cnt_3, h_cnt_4, h_cnt_5, h_cnt_6, v_cnt_1, v_cnt_2, v_cnt_3, v_cnt_4, v_cnt_5, v_cnt_6,
        mouseInStart, pixel_start);
    wire [11:0] pixel_menu;
    Render_Menu Render_Menu (rst, clk, clk_25MHz, h_cnt, v_cnt,
        h_cnt_1, h_cnt_2, h_cnt_3, h_cnt_4, h_cnt_5, h_cnt_6, v_cnt_1, v_cnt_2, v_cnt_3, v_cnt_4, v_cnt_5, v_cnt_6,
        mouseInLevel1, mouseInLevel2, mouseInLevel3, pixel_menu);
    wire [11:0] pixel_play;
    Render_Play Render_Play (rst, pause, clk, clk_25MHz, scene, h_cnt, v_cnt,
        h_cnt_1, h_cnt_2, h_cnt_3, h_cnt_4, h_cnt_5, h_cnt_6, v_cnt_1, v_cnt_2, v_cnt_3, v_cnt_4, v_cnt_5, v_cnt_6,
        towerBlood_E_tr, towerBlood_A_tr, Enemy_Instance, Army_Instance, genArmyCD, ableToUpgrade, money, purse_level, tower_cnt, mouseInFrame, twinkle, pixel_play);
    wire [11:0] pixel_winLose;
    Render_WinLose Render_WinLose (rst, clk, clk_25MHz, h_cnt_1, v_cnt_1, h_cnt_5, v_cnt_5,
        scene, twinkle, pixel_winLose);

    parameter DIFF_V = 4'd5;
    wire [3:0] pixel_play_r = pixel_play[11:8] + DIFF_V;
    wire [3:0] pixel_play_g = pixel_play[7:4] + DIFF_V;
    wire [3:0] pixel_play_b = pixel_play[3:0] + DIFF_V;
    wire [11:0] pixel_play_tint = {((pixel_play_r<DIFF_V)?4'd15:pixel_play_r), ((pixel_play_g<DIFF_V)?4'd15:pixel_play_g), ((pixel_play_b<DIFF_V)?4'd15:pixel_play_b)};

    always @(posedge clk_25MHz) begin
        if (!valid)                    {vgaRed, vgaGreen, vgaBlue} <= 12'h0;
        else if (enable_mouse_display) {vgaRed, vgaGreen, vgaBlue} <= mouse_pixel;
        else begin
            case(scene)
                S_START:         {vgaRed, vgaGreen, vgaBlue} <= pixel_start;
                S_MENU:          {vgaRed, vgaGreen, vgaBlue} <= pixel_menu;
                S_PLAY1, S_PLAY2, S_PLAY3 : {vgaRed, vgaGreen, vgaBlue} <= pixel_play;
                S_WIN, S_LOSE:   {vgaRed, vgaGreen, vgaBlue} <= (pixel_winLose!=12'heee) ? pixel_winLose : pixel_play_tint;
                default: {vgaRed, vgaGreen, vgaBlue} <= 12'h0;
            endcase
        end
    end
endmodule