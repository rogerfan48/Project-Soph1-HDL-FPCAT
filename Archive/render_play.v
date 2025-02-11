// `define W_PP 18:12
// `define H_PP 11:5

// `define       EXIST_P  55
// `define        TYPE_P  54:52
// `define           X_P  51:42
// `define           Y_P  41:32
// `define          HP_P  31:20
// `define       STATE_P  19:16
// `define   STATE_CNT_P  15:12
// `define  BE_DAMAGED_P  11:0

module Render_Play (
    input clk,
    input [9:0] h_cnt,
    input [9:0] ah_cnt,
    input [9:0] v_cnt,
    input [9:0] av_cnt,
    input [55:0] Enemy_Instance [15:0],
    input [55:0] Army_Instance [15:0],
    input [9:0] mouseInFrame,
    output reg [11:0] pixel
);

    wire [9:0] tower_enemy_addr = (((av_cnt-90)/3)*20 + ((ah_cnt-10)/3)) % 800;
    wire [1:0] tower_enemy_value;
    mem_Tower_Enemy mem_Tower_Enemy (.clka(clk), .wea(0), .addra(tower_enemy_addr), .dina(0), .douta(tower_enemy_value));

    reg [18:0] enemy_0_pixel_value;
    reg  [2:0] enemy_0_picNum;
    Enemy_Pixel EnemyPixel0 (Enemy_Instance[0][54:52], enemy_0_pixel_value);
    PicNum_By_State PicNum_By_State0 (Enemy_Instance[0][19:16], Enemy_Instance[0][45], enemy_0_picNum);
    wire [11:0] enemy_0_addr = (((av_cnt - Enemy_Instance[0][41:32]) >> 1) * enemy_0_pixel_value[18:12]) + (((ah_cnt - Enemy_Instance[0][51:42])) >> 1) + (enemy_0_pixel_value[18:12] * enemy_0_pixel_value[11:5] * enemy_0_picNum);   
    wire [1:0] enemy_0_value;
    Enemy_Render_Pixel enemy_0_Render (.clk(clk), .ctype(Enemy_Instance[0][54:52]), .addr(enemy_0_addr), .pixel_value(enemy_0_value));

    reg [18:0] enemy_1_pixel_value;
    reg  [2:0] enemy_1_picNum;
    Enemy_Pixel EnemyPixel1 (Enemy_Instance[1][54:52], enemy_1_pixel_value);
    PicNum_By_State PicNum_By_State1 (Enemy_Instance[1][19:16], Enemy_Instance[1][45], enemy_1_picNum);
    wire [11:0] enemy_1_addr = (((av_cnt - Enemy_Instance[1][41:32]) >> 1) * enemy_1_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[1][51:42])) >> 1) + (enemy_1_pixel_value[18:12] * enemy_1_pixel_value[11:5] * enemy_1_picNum);   
    wire [1:0] enemy_1_value;
    Enemy_Render_Pixel enemy_1_Render (.clk(clk), .ctype(Enemy_Instance[1][54:52]), .addr(enemy_1_addr), .pixel_value(enemy_1_value));

    reg [18:0] enemy_2_pixel_value;
    reg  [2:0] enemy_2_picNum;
    Enemy_Pixel EnemyPixel2 (Enemy_Instance[2][54:52], enemy_2_pixel_value);
    PicNum_By_State PicNum_By_State2 (Enemy_Instance[2][19:16], Enemy_Instance[2][45], enemy_2_picNum);
    wire [11:0] enemy_2_addr = (((av_cnt - Enemy_Instance[2][41:32]) >> 1) * enemy_2_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[1][51:42])) >> 1) + (enemy_2_pixel_value[18:12] * enemy_2_pixel_value[11:5] * enemy_2_picNum);
    wire [1:0] enemy_2_value;
    Enemy_Render_Pixel enemy_2_Render (.clk(clk), .ctype(Enemy_Instance[2][54:52]), .addr(enemy_2_addr), .pixel_value(enemy_2_value));

    reg [18:0] enemy_3_pixel_value;
    reg  [2:0] enemy_3_picNum;
    Enemy_Pixel EnemyPixel3 (Enemy_Instance[3][54:52], enemy_3_pixel_value);
    PicNum_By_State PicNum_By_State3 (Enemy_Instance[3][19:16], Enemy_Instance[3][45], enemy_3_picNum);
    wire [11:0] enemy_3_addr = (((av_cnt - Enemy_Instance[3][41:32]) >> 1) * enemy_3_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[3][51:42])) >> 1) + (enemy_3_pixel_value[18:12] * enemy_3_pixel_value[11:5] * enemy_3_picNum);
    wire [1:0] enemy_3_value;
    Enemy_Render_Pixel enemy_3_Render (.clk(clk), .ctype(Enemy_Instance[3][54:52]), .addr(enemy_3_addr), .pixel_value(enemy_3_value));

    reg [18:0] enemy_4_pixel_value;
    reg  [2:0] enemy_4_picNum;
    Enemy_Pixel EnemyPixel4 (Enemy_Instance[4][54:52], enemy_4_pixel_value);
    PicNum_By_State PicNum_By_State4 (Enemy_Instance[4][19:16], Enemy_Instance[4][45], enemy_4_picNum);
    wire [11:0] enemy_4_addr = (((av_cnt - Enemy_Instance[4][41:32]) >> 1) * enemy_4_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[4][51:42])) >> 1) + (enemy_4_pixel_value[18:12] * enemy_4_pixel_value[11:5] * enemy_4_picNum);
    wire [1:0] enemy_4_value;
    Enemy_Render_Pixel enemy_4_Render (.clk(clk), .ctype(Enemy_Instance[4][54:52]), .addr(enemy_4_addr), .pixel_value(enemy_4_value));

    reg [18:0] enemy_5_pixel_value;
    reg  [2:0] enemy_5_picNum;
    Enemy_Pixel EnemyPixel5 (Enemy_Instance[5][54:52], enemy_5_pixel_value);
    PicNum_By_State PicNum_By_State5 (Enemy_Instance[5][19:16], Enemy_Instance[5][45], enemy_5_picNum);
    wire [11:0] enemy_5_addr = (((av_cnt - Enemy_Instance[5][41:32]) >> 1) * enemy_5_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[5][51:42])) >> 1) + (enemy_5_pixel_value[18:12] * enemy_5_pixel_value[11:5] * enemy_5_picNum);
    wire [1:0] enemy_5_value;
    Enemy_Render_Pixel enemy_5_Render (.clk(clk), .ctype(Enemy_Instance[5][54:52]), .addr(enemy_5_addr), .pixel_value(enemy_5_value));

    reg [18:0] enemy_6_pixel_value;
    reg  [2:0] enemy_6_picNum;
    Enemy_Pixel EnemyPixel6 (Enemy_Instance[6][54:52], enemy_6_pixel_value);
    PicNum_By_State PicNum_By_State6 (Enemy_Instance[6][19:16], Enemy_Instance[6][45], enemy_6_picNum);
    wire [11:0] enemy_6_addr = (((av_cnt - Enemy_Instance[6][41:32]) >> 1) * enemy_6_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[6][51:42])) >> 1) + (enemy_6_pixel_value[18:12] * enemy_6_pixel_value[11:5] * enemy_6_picNum);
    wire [1:0] enemy_6_value;
    Enemy_Render_Pixel enemy_6_Render (.clk(clk), .ctype(Enemy_Instance[6][54:52]), .addr(enemy_6_addr), .pixel_value(enemy_6_value));

    reg [18:0] enemy_7_pixel_value;
    reg  [2:0] enemy_7_picNum;
    Enemy_Pixel EnemyPixel7 (Enemy_Instance[7][54:52], enemy_7_pixel_value);
    PicNum_By_State PicNum_By_State7 (Enemy_Instance[7][19:16], Enemy_Instance[7][45], enemy_7_picNum);
    wire [11:0] enemy_7_addr = (((av_cnt - Enemy_Instance[7][41:32]) >> 1) * enemy_7_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[7][51:42])) >> 1) + (enemy_7_pixel_value[18:12] * enemy_7_pixel_value[11:5] * enemy_7_picNum);
    wire [1:0] enemy_7_value;
    Enemy_Render_Pixel enemy_7_Render (.clk(clk), .ctype(Enemy_Instance[7][54:52]), .addr(enemy_7_addr), .pixel_value(enemy_7_value));

    reg [18:0] enemy_8_pixel_value;
    reg  [2:0] enemy_8_picNum;
    Enemy_Pixel EnemyPixel8 (Enemy_Instance[8][54:52], enemy_8_pixel_value);
    PicNum_By_State PicNum_By_State8 (Enemy_Instance[8][19:16], Enemy_Instance[8][45], enemy_8_picNum);
    wire [11:0] enemy_8_addr = (((av_cnt - Enemy_Instance[8][41:32]) >> 1) * enemy_8_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[8][51:42])) >> 1) + (enemy_8_pixel_value[18:12] * enemy_8_pixel_value[11:5] * enemy_8_picNum);
    wire [1:0] enemy_8_value;
    Enemy_Render_Pixel enemy_8_Render (.clk(clk), .ctype(Enemy_Instance[8][54:52]), .addr(enemy_8_addr), .pixel_value(enemy_8_value));

    reg [18:0] enemy_9_pixel_value;
    reg  [2:0] enemy_9_picNum;
    Enemy_Pixel EnemyPixel9 (Enemy_Instance[9][54:52], enemy_9_pixel_value);
    PicNum_By_State PicNum_By_State9 (Enemy_Instance[9][19:16], Enemy_Instance[9][45], enemy_9_picNum);
    wire [11:0] enemy_9_addr = (((av_cnt - Enemy_Instance[9][41:32]) >> 1) * enemy_9_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[9][51:42])) >> 1) + (enemy_9_pixel_value[18:12] * enemy_9_pixel_value[11:5] * enemy_9_picNum);
    wire [1:0] enemy_9_value;
    Enemy_Render_Pixel enemy_9_Render (.clk(clk), .ctype(Enemy_Instance[9][54:52]), .addr(enemy_9_addr), .pixel_value(enemy_9_value));

    reg [18:0] enemy_10_pixel_value;
    reg  [2:0] enemy_10_picNum;
    Enemy_Pixel EnemyPixel10 (Enemy_Instance[10][54:52], enemy_10_pixel_value);
    PicNum_By_State PicNum_By_State10 (Enemy_Instance[10][19:16], Enemy_Instance[10][45], enemy_10_picNum);
    wire [11:0] enemy_10_addr = (((av_cnt - Enemy_Instance[10][41:32]) >> 1) * enemy_10_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[10][51:42])) >> 1) + (enemy_10_pixel_value[18:12] * enemy_10_pixel_value[11:5] * enemy_10_picNum);
    wire [1:0] enemy_10_value;
    Enemy_Render_Pixel enemy_10_Render (.clk(clk), .ctype(Enemy_Instance[10][54:52]), .addr(enemy_10_addr), .pixel_value(enemy_10_value));

    reg [18:0] enemy_11_pixel_value;
    reg  [2:0] enemy_11_picNum;
    Enemy_Pixel EnemyPixel11 (Enemy_Instance[11][54:52], enemy_11_pixel_value);
    PicNum_By_State PicNum_By_State11 (Enemy_Instance[11][19:16], Enemy_Instance[11][45], enemy_11_picNum);
    wire [11:0] enemy_11_addr = (((av_cnt - Enemy_Instance[11][41:32]) >> 1) * enemy_11_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[11][51:42])) >> 1) + (enemy_11_pixel_value[18:12] * enemy_11_pixel_value[11:5] * enemy_11_picNum);
    wire [1:0] enemy_11_value;
    Enemy_Render_Pixel enemy_11_Render (.clk(clk), .ctype(Enemy_Instance[11][54:52]), .addr(enemy_11_addr), .pixel_value(enemy_11_value));

    reg [18:0] enemy_12_pixel_value;
    reg  [2:0] enemy_12_picNum;
    Enemy_Pixel EnemyPixel12 (Enemy_Instance[12][54:52], enemy_12_pixel_value);
    PicNum_By_State PicNum_By_State12 (Enemy_Instance[12][19:16], Enemy_Instance[12][45], enemy_12_picNum);
    wire [11:0] enemy_12_addr = (((av_cnt - Enemy_Instance[12][41:32]) >> 1) * enemy_12_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[12][51:42])) >> 1) + (enemy_12_pixel_value[18:12] * enemy_12_pixel_value[11:5] * enemy_12_picNum);
    wire [1:0] enemy_12_value;
    Enemy_Render_Pixel enemy_12_Render (.clk(clk), .ctype(Enemy_Instance[12][54:52]), .addr(enemy_12_addr), .pixel_value(enemy_12_value));

    reg [18:0] enemy_13_pixel_value;
    reg  [2:0] enemy_13_picNum;
    Enemy_Pixel EnemyPixel13 (Enemy_Instance[13][54:52], enemy_13_pixel_value);
    PicNum_By_State PicNum_By_State13 (Enemy_Instance[13][19:16], Enemy_Instance[13][45], enemy_13_picNum);
    wire [11:0] enemy_13_addr = (((av_cnt - Enemy_Instance[13][41:32]) >> 1) * enemy_13_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[13][51:42])) >> 1) + (enemy_13_pixel_value[18:12] * enemy_13_pixel_value[11:5] * enemy_13_picNum);
    wire [1:0] enemy_13_value;
    Enemy_Render_Pixel enemy_13_Render (.clk(clk), .ctype(Enemy_Instance[13][54:52]), .addr(enemy_13_addr), .pixel_value(enemy_13_value));

    reg [18:0] enemy_14_pixel_value;
    reg  [2:0] enemy_14_picNum;
    Enemy_Pixel EnemyPixel14 (Enemy_Instance[14][54:52], enemy_14_pixel_value);
    PicNum_By_State PicNum_By_State14 (Enemy_Instance[14][19:16], Enemy_Instance[14][45], enemy_14_picNum);
    wire [11:0] enemy_14_addr = (((av_cnt - Enemy_Instance[14][41:32]) >> 1) * enemy_14_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[14][51:42])) >> 1) + (enemy_14_pixel_value[18:12] * enemy_14_pixel_value[11:5] * enemy_14_picNum);
    wire [1:0] enemy_14_value;
    Enemy_Render_Pixel enemy_14_Render (.clk(clk), .ctype(Enemy_Instance[14][54:52]), .addr(enemy_14_addr), .pixel_value(enemy_14_value));

    reg [18:0] enemy_15_pixel_value;
    reg  [2:0] enemy_15_picNum;
    Enemy_Pixel EnemyPixel15 (Enemy_Instance[15][54:52], enemy_15_pixel_value);
    PicNum_By_State PicNum_By_State15 (Enemy_Instance[15][19:16], Enemy_Instance[15][45], enemy_15_picNum);
    wire [11:0] enemy_15_addr = (((av_cnt - Enemy_Instance[15][41:32]) >> 1) * enemy_15_pixel_value[18:12]) + (((ah_cnt-Enemy_Instance[15][51:42])) >> 1) + (enemy_15_pixel_value[18:12] * enemy_15_pixel_value[11:5] * enemy_15_picNum);
    wire [1:0] enemy_15_value;
    Enemy_Render_Pixel enemy_15_Render (.clk(clk), .ctype(Enemy_Instance[15][54:52]), .addr(enemy_15_addr), .pixel_value(enemy_15_value));

    
    reg [18:0] army_0_pixel_value;
    reg  [2:0] army_0_picNum;
    Army_Pixel ArmyPixel0 (Army_Instance[0][54:52], army_0_pixel_value);
    PicNum_By_State PicNum_By_State16 (Army_Instance[0][19:16], Army_Instance[0][45], army_0_picNum);
    wire [12:0] army_0_addr = (((av_cnt - Army_Instance[0][41:32]) >> 1) * army_0_pixel_value[18:12]) + (((ah_cnt - Army_Instance[0][51:42])) >> 1) + (army_0_pixel_value[18:12] * army_0_pixel_value[11:5] * army_0_picNum);
    wire [1:0] army_0_value;
    Army_Render_Pixel army_0_Render (.clk(clk), .ctype(Army_Instance[0][54:52]), .addr(army_0_addr), .pixel_value(army_0_value));

    reg [18:0] army_1_pixel_value;
    reg  [2:0] army_1_picNum;
    Army_Pixel ArmyPixel1 (Army_Instance[1][54:52], army_1_pixel_value);
    PicNum_By_State PicNum_By_State17 (Army_Instance[1][19:16], Army_Instance[1][45], army_1_picNum);
    wire [12:0] army_1_addr = (((av_cnt - Army_Instance[1][41:32]) >> 1) * army_1_pixel_value[18:12]) + (((ah_cnt - Army_Instance[1][51:42])) >> 1) + (army_1_pixel_value[18:12] * army_1_pixel_value[11:5] * army_1_picNum);
    wire [1:0] army_1_value;
    Army_Render_Pixel army_1_Render (.clk(clk), .ctype(Army_Instance[1][54:52]), .addr(army_1_addr), .pixel_value(army_1_value));

    reg [18:0] army_2_pixel_value;
    reg  [2:0] army_2_picNum;
    Army_Pixel ArmyPixel2 (Army_Instance[2][54:52], army_2_pixel_value);
    PicNum_By_State PicNum_By_State18 (Army_Instance[2][19:16], Army_Instance[2][45], army_2_picNum);
    wire [12:0] army_2_addr = (((av_cnt - Army_Instance[2][41:32]) >> 1) * army_2_pixel_value[18:12]) + (((ah_cnt - Army_Instance[2][51:42])) >> 1) + (army_2_pixel_value[18:12] * army_2_pixel_value[11:5] * army_2_picNum);
    wire [1:0] army_2_value;
    Army_Render_Pixel army_2_Render (.clk(clk), .ctype(Army_Instance[2][54:52]), .addr(army_2_addr), .pixel_value(army_2_value));

    reg [18:0] army_3_pixel_value;
    reg  [2:0] army_3_picNum;
    Army_Pixel ArmyPixel3 (Army_Instance[3][54:52], army_3_pixel_value);
    PicNum_By_State PicNum_By_State19 (Army_Instance[3][19:16], Army_Instance[3][45], army_3_picNum);
    wire [12:0] army_3_addr = (((av_cnt - Army_Instance[3][41:32]) >> 1) * army_3_pixel_value[18:12]) + (((ah_cnt - Army_Instance[3][51:42])) >> 1) + (army_3_pixel_value[18:12] * army_3_pixel_value[11:5] * army_3_picNum);
    wire [1:0] army_3_value;
    Army_Render_Pixel army_3_Render (.clk(clk), .ctype(Army_Instance[3][54:52]), .addr(army_3_addr), .pixel_value(army_3_value));

    reg [18:0] army_4_pixel_value;
    reg  [2:0] army_4_picNum;
    Army_Pixel ArmyPixel4 (Army_Instance[4][54:52], army_4_pixel_value);
    PicNum_By_State PicNum_By_State20 (Army_Instance[4][19:16], Army_Instance[4][45], army_4_picNum);
    wire [12:0] army_4_addr = (((av_cnt - Army_Instance[4][41:32]) >> 1) * army_4_pixel_value[18:12]) + (((ah_cnt - Army_Instance[4][51:42])) >> 1) + (army_4_pixel_value[18:12] * army_4_pixel_value[11:5] * army_4_picNum);
    wire [1:0] army_4_value;
    Army_Render_Pixel army_4_Render (.clk(clk), .ctype(Army_Instance[4][54:52]), .addr(army_4_addr), .pixel_value(army_4_value));

    reg [18:0] army_5_pixel_value;
    reg  [2:0] army_5_picNum;
    Army_Pixel ArmyPixel5 (Army_Instance[5][54:52], army_5_pixel_value);
    PicNum_By_State PicNum_By_State21 (Army_Instance[5][19:16], Army_Instance[5][45], army_5_picNum);
    wire [12:0] army_5_addr = (((av_cnt - Army_Instance[5][41:32]) >> 1) * army_5_pixel_value[18:12]) + (((ah_cnt - Army_Instance[5][51:42])) >> 1) + (army_5_pixel_value[18:12] * army_5_pixel_value[11:5] * army_5_picNum);
    wire [1:0] army_5_value;
    Army_Render_Pixel army_5_Render (.clk(clk), .ctype(Army_Instance[5][54:52]), .addr(army_5_addr), .pixel_value(army_5_value));

    reg [18:0] army_6_pixel_value;
    reg  [2:0] army_6_picNum;
    Army_Pixel ArmyPixel6 (Army_Instance[6][54:52], army_6_pixel_value);
    PicNum_By_State PicNum_By_State22 (Army_Instance[6][19:16], Army_Instance[6][45], army_6_picNum);
    wire [12:0] army_6_addr = (((av_cnt - Army_Instance[6][41:32]) >> 1) * army_6_pixel_value[18:12]) + (((ah_cnt - Army_Instance[6][51:42])) >> 1) + (army_6_pixel_value[18:12] * army_6_pixel_value[11:5] * army_6_picNum);
    wire [1:0] army_6_value;
    Army_Render_Pixel army_6_Render (.clk(clk), .ctype(Army_Instance[6][54:52]), .addr(army_6_addr), .pixel_value(army_6_value));

    reg [18:0] army_7_pixel_value;
    reg  [2:0] army_7_picNum;
    Army_Pixel ArmyPixel7 (Army_Instance[7][54:52], army_7_pixel_value);
    PicNum_By_State PicNum_By_State23 (Army_Instance[7][19:16], Army_Instance[7][45], army_7_picNum);
    wire [12:0] army_7_addr = (((av_cnt - Army_Instance[7][41:32]) >> 1) * army_7_pixel_value[18:12]) + (((ah_cnt - Army_Instance[7][51:42])) >> 1) + (army_7_pixel_value[18:12] * army_7_pixel_value[11:5] * army_7_picNum);
    wire [1:0] army_7_value;
    Army_Render_Pixel army_7_Render (.clk(clk), .ctype(Army_Instance[7][54:52]), .addr(army_7_addr), .pixel_value(army_7_value));

    reg [18:0] army_8_pixel_value;
    reg  [2:0] army_8_picNum;
    Army_Pixel ArmyPixel8 (Army_Instance[8][54:52], army_8_pixel_value);
    PicNum_By_State PicNum_By_State24 (Army_Instance[8][19:16], Army_Instance[8][45], army_8_picNum);
    wire [12:0] army_8_addr = (((av_cnt - Army_Instance[8][41:32]) >> 1) * army_8_pixel_value[18:12]) + (((ah_cnt - Army_Instance[8][51:42])) >> 1) + (army_8_pixel_value[18:12] * army_8_pixel_value[11:5] * army_8_picNum);
    wire [1:0] army_8_value;
    Army_Render_Pixel army_8_Render (.clk(clk), .ctype(Army_Instance[8][54:52]), .addr(army_8_addr), .pixel_value(army_8_value));

    reg [18:0] army_9_pixel_value;
    reg  [2:0] army_9_picNum;
    Army_Pixel ArmyPixel9 (Army_Instance[9][54:52], army_9_pixel_value);
    PicNum_By_State PicNum_By_State25 (Army_Instance[9][19:16], Army_Instance[9][45], army_9_picNum);
    wire [12:0] army_9_addr = (((av_cnt - Army_Instance[9][41:32]) >> 1) * army_9_pixel_value[18:12]) + (((ah_cnt - Army_Instance[9][51:42])) >> 1) + (army_9_pixel_value[18:12] * army_9_pixel_value[11:5] * army_9_picNum);
    wire [1:0] army_9_value;
    Army_Render_Pixel army_9_Render (.clk(clk), .ctype(Army_Instance[9][54:52]), .addr(army_9_addr), .pixel_value(army_9_value));

    reg [18:0] army_10_pixel_value;
    reg  [2:0] army_10_picNum;
    Army_Pixel ArmyPixel10 (Army_Instance[10][54:52], army_10_pixel_value);
    PicNum_By_State PicNum_By_State26 (Army_Instance[10][19:16], Army_Instance[10][45], army_10_picNum);
    wire [12:0] army_10_addr = (((av_cnt - Army_Instance[10][41:32]) >> 1) * army_10_pixel_value[18:12]) + (((ah_cnt - Army_Instance[10][51:42])) >> 1) + (army_10_pixel_value[18:12] * army_10_pixel_value[11:5] * army_10_picNum);
    wire [1:0] army_10_value;
    Army_Render_Pixel army_10_Render (.clk(clk), .ctype(Army_Instance[10][54:52]), .addr(army_10_addr), .pixel_value(army_10_value));

    reg [18:0] army_11_pixel_value;
    reg  [2:0] army_11_picNum;
    Army_Pixel ArmyPixel11 (Army_Instance[11][54:52], army_11_pixel_value);
    PicNum_By_State PicNum_By_State27 (Army_Instance[11][19:16], Army_Instance[11][45], army_11_picNum);
    wire [12:0] army_11_addr = (((av_cnt - Army_Instance[11][41:32]) >> 1) * army_11_pixel_value[18:12]) + (((ah_cnt - Army_Instance[11][51:42])) >> 1) + (army_11_pixel_value[18:12] * army_11_pixel_value[11:5] * army_11_picNum);
    wire [1:0] army_11_value;
    Army_Render_Pixel army_11_Render (.clk(clk), .ctype(Army_Instance[11][54:52]), .addr(army_11_addr), .pixel_value(army_11_value));

    reg [18:0] army_12_pixel_value;
    reg  [2:0] army_12_picNum;
    Army_Pixel ArmyPixel12 (Army_Instance[12][54:52], army_12_pixel_value);
    PicNum_By_State PicNum_By_State28 (Army_Instance[12][19:16], Army_Instance[12][45], army_12_picNum);
    wire [12:0] army_12_addr = (((av_cnt - Army_Instance[12][41:32]) >> 1) * army_12_pixel_value[18:12]) + (((ah_cnt - Army_Instance[12][51:42])) >> 1) + (army_12_pixel_value[18:12] * army_12_pixel_value[11:5] * army_12_picNum);
    wire [1:0] army_12_value;
    Army_Render_Pixel army_12_Render (.clk(clk), .ctype(Army_Instance[12][54:52]), .addr(army_12_addr), .pixel_value(army_12_value));

    reg [18:0] army_13_pixel_value;
    reg  [2:0] army_13_picNum;
    Army_Pixel ArmyPixel13 (Army_Instance[13][54:52], army_13_pixel_value);
    PicNum_By_State PicNum_By_State29 (Army_Instance[13][19:16], Army_Instance[13][45], army_13_picNum);
    wire [12:0] army_13_addr = (((av_cnt - Army_Instance[13][41:32]) >> 1) * army_13_pixel_value[18:12]) + (((ah_cnt - Army_Instance[13][51:42])) >> 1) + (army_13_pixel_value[18:12] * army_13_pixel_value[11:5] * army_13_picNum);
    wire [1:0] army_13_value;
    Army_Render_Pixel army_13_Render (.clk(clk), .ctype(Army_Instance[13][54:52]), .addr(army_13_addr), .pixel_value(army_13_value));

    reg [18:0] army_14_pixel_value;
    reg  [2:0] army_14_picNum;
    Army_Pixel ArmyPixel14 (Army_Instance[14][54:52], army_14_pixel_value);
    PicNum_By_State PicNum_By_State30 (Army_Instance[14][19:16], Army_Instance[14][45], army_14_picNum);
    wire [12:0] army_14_addr = (((av_cnt - Army_Instance[14][41:32]) >> 1) * army_14_pixel_value[18:12]) + (((ah_cnt - Army_Instance[14][51:42])) >> 1) + (army_14_pixel_value[18:12] * army_14_pixel_value[11:5] * army_14_picNum);
    wire [1:0] army_14_value;
    Army_Render_Pixel army_14_Render (.clk(clk), .ctype(Army_Instance[14][54:52]), .addr(army_14_addr), .pixel_value(army_14_value));

    reg [18:0] army_15_pixel_value;
    reg  [2:0] army_15_picNum;
    Army_Pixel ArmyPixel15 (Army_Instance[15][54:52], army_15_pixel_value);
    PicNum_By_State PicNum_By_State31 (Army_Instance[15][19:16], Army_Instance[15][45], army_15_picNum);
    wire [12:0] army_15_addr = (((av_cnt - Army_Instance[15][41:32]) >> 1) * army_15_pixel_value[18:12]) + (((ah_cnt - Army_Instance[15][51:42])) >> 1) + (army_15_pixel_value[18:12] * army_15_pixel_value[11:5] * army_15_picNum);
    wire [1:0] army_15_value;
    Army_Render_Pixel army_15_Render (.clk(clk), .ctype(Army_Instance[15][54:52]), .addr(army_15_addr), .pixel_value(army_15_value));

    wire [9:0] tower_enemy_addr_0 = ((av_cnt-90)/3)*20 + ((ah_cnt-10)/3);
    wire [9:0] tower_enemy_addr = (tower_enemy_addr_0 < 800 ? tower_enemy_addr_0 : 0);
    wire [1:0] tower_enemy_value;
    mem_Tower_Enemy mem_Tower_Enemy (.clka(clk), .wea(0), .addra(tower_enemy_addr), .dina(0), .douta(tower_enemy_value));
    wire [9:0] tower_cat_addr_0 = ((av_cnt-90)/3)*20 + ((ah_cnt-570)/3);
    wire [9:0] tower_cat_addr = (tower_cat_addr_0 < 800 ? tower_cat_addr_0 : 0);
    wire [1:0] tower_cat_value;
    mem_Tower_Cat mem_Tower_Cat (.clka(clk), .wea(0), .addra(tower_cat_addr), .dina(0), .douta(tower_cat_value));

    wire [8:0] frame_joker_addr_0 = ((av_cnt-290)/4)*25 + ((ah_cnt-105)/4);
    wire [8:0] frame_joker_addr = (frame_joker_addr_0 < 500 ? frame_joker_addr_0 : 0);
    wire [1:0] frame_joker_value;
    mem_Frame_Joker_Cat mem_Frame_Joker_Cat (.clka(clk), .wea(0), .addra(frame_joker_addr), .dina(0), .douta(frame_joker_value));
    wire [8:0] frame_fish_addr_0 = ((av_cnt-290)/4)*25 + ((ah_cnt-215)/4);
    wire [8:0] frame_fish_addr = (frame_fish_addr_0 < 500 ? frame_fish_addr_0 : 0);
    wire [1:0] frame_fish_value;
    mem_Frame_Fish_Cat mem_Frame_Fish_Cat (.clka(clk), .wea(0), .addra(frame_fish_addr), .dina(0), .douta(frame_fish_value));
    wire [8:0] frame_trap_addr_0 = ((av_cnt-290)/4)*25 + ((ah_cnt-325)/4);
    wire [8:0] frame_trap_addr = (frame_trap_addr_0 < 500 ? frame_trap_addr_0 : 0);
    wire [1:0] frame_trap_value;
    mem_Frame_Trap_Cat mem_Frame_Trap_Cat (.clka(clk), .wea(0), .addra(frame_trap_addr), .dina(0), .douta(frame_trap_value));
    wire [8:0] frame_jay_addr_0 = ((av_cnt-290)/4)*25 + ((ah_cnt-435)/4);
    wire [8:0] frame_jay_addr = (frame_jay_addr_0 < 500 ? frame_jay_addr_0 : 0);
    wire [1:0] frame_jay_value;
    mem_Frame_Jay_Cat mem_Frame_Jay_Cat (.clka(clk), .wea(0), .addra(frame_jay_addr), .dina(0), .douta(frame_jay_value));
    wire [8:0] frame_bomb_addr_0 = ((av_cnt-380)/4)*25 + ((ah_cnt-105)/4);
    wire [8:0] frame_bomb_addr = (frame_bomb_addr_0 < 500 ? frame_bomb_addr_0 : 0);
    wire [1:0] frame_bomb_value;
    mem_Frame_Bomb_Cat mem_Frame_Bomb_Cat (.clka(clk), .wea(0), .addra(frame_bomb_addr), .dina(0), .douta(frame_bomb_value));
    wire [8:0] frame_CY_addr_0 = ((av_cnt-380)/4)*25 + ((ah_cnt-215)/4);
    wire [8:0] frame_CY_addr = (frame_CY_addr_0 < 500 ? frame_CY_addr_0 : 0);
    wire [1:0] frame_CY_value;
    mem_Frame_CY_Cat mem_Frame_CY_Cat (.clka(clk), .wea(0), .addra(frame_CY_addr), .dina(0), .douta(frame_CY_value));
    wire [8:0] frame_hacker_addr_0 = ((av_cnt-380)/4)*25 + ((ah_cnt-325)/4);
    wire [8:0] frame_hacker_addr = (frame_hacker_addr_0 < 500 ? frame_hacker_addr_0 : 0);
    wire [1:0] frame_hacker_value;
    mem_Frame_Hacker_Cat mem_Frame_Hacker_Cat (.clka(clk), .wea(0), .addra(frame_hacker_addr), .dina(0), .douta(frame_hacker_value));
    wire [8:0] frame_elephant_addr_0 = ((av_cnt-380)/4)*25 + ((ah_cnt-435)/4);
    wire [8:0] frame_elephant_addr = (frame_elephant_addr_0 < 500 ? frame_elephant_addr_0 : 0);
    wire [1:0] frame_elephant_value;
    mem_Frame_Elephant_Cat mem_Frame_Elephant_Cat (.clka(clk), .wea(0), .addra(frame_elephant_addr), .dina(0), .douta(frame_elephant_value));

    wire [11:0] btn_purse_addr_0 = ((av_cnt-380)/2)*50 + ((ah_cnt)/2);
    wire [11:0] btn_purse_addr = (btn_purse_addr_0 < 5000 ? btn_purse_addr_0 : 0);
    wire [1:0] btn_purse_value;
    mem_Btn_Purse mem_Btn_Purse (.clka(clk), .wea(0), .addra(btn_purse_addr), .dina(0), .douta(btn_purse_value));
    wire [12:0] btn_fire_addr_0 = ((av_cnt-380)/2)*50 + ((ah_cnt-540)/2) + 2500;
    wire [12:0] btn_fire_addr = (btn_fire_addr_0 < 5000 ? btn_fire_addr_0 : 0);
    wire [1:0] btn_fire_value;
    mem_Btn_Fire mem_Btn_Fire (.clka(clk), .wea(0), .addra(btn_fire_addr), .dina(0), .douta(btn_fire_value));

    always @(*) begin
        if (v_cnt<10'd270) begin    // simply cut half, this is upper half (gaming) for shortening Circuit Longest Length
            if (Army_Instance[0][55] && h_cnt>=Army_Instance[0][51:42] && h_cnt<Army_Instance[0][51:42]+army_0_pixel_value[18:12] && v_cnt>=Army_Instance[0][41:32] && v_cnt<Army_Instance[0][41:32]+army_0_pixel_value[11:5] && army_0_pixel_value != 2'b11) begin
                case (army_0_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[1][55] && h_cnt>=Army_Instance[1][51:42] && h_cnt<Army_Instance[1][51:42]+army_1_pixel_value[18:12] && v_cnt>=Army_Instance[1][41:32] && v_cnt<Army_Instance[1][41:32]+army_1_pixel_value[11:5] && army_1_pixel_value != 2'b11) begin
                case (army_1_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[2][55] && h_cnt>=Army_Instance[2][51:42] && h_cnt<Army_Instance[2][51:42]+army_2_pixel_value[18:12] && v_cnt>=Army_Instance[2][41:32] && v_cnt<Army_Instance[2][41:32]+army_2_pixel_value[11:5] && army_2_pixel_value != 2'b11) begin
                case (army_2_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[3][55] && h_cnt>=Army_Instance[3][51:42] && h_cnt<Army_Instance[3][51:42]+army_3_pixel_value[18:12] && v_cnt>=Army_Instance[3][41:32] && v_cnt<Army_Instance[3][41:32]+army_3_pixel_value[11:5] && army_3_pixel_value != 2'b11) begin
                case (army_3_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[4][55] && h_cnt>=Army_Instance[4][51:42] && h_cnt<Army_Instance[4][51:42]+army_4_pixel_value[18:12] && v_cnt>=Army_Instance[4][41:32] && v_cnt<Army_Instance[4][41:32]+army_4_pixel_value[11:5] && army_4_pixel_value != 2'b11) begin
                case (army_4_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[5][55] && h_cnt>=Army_Instance[5][51:42] && h_cnt<Army_Instance[5][51:42]+army_5_pixel_value[18:12] && v_cnt>=Army_Instance[5][41:32] && v_cnt<Army_Instance[5][41:32]+army_5_pixel_value[11:5] && army_5_pixel_value != 2'b11) begin
                case (army_5_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[6][55] && h_cnt>=Army_Instance[6][51:42] && h_cnt<Army_Instance[6][51:42]+army_6_pixel_value[18:12] && v_cnt>=Army_Instance[6][41:32] && v_cnt<Army_Instance[6][41:32]+army_6_pixel_value[11:5] && army_6_pixel_value != 2'b11) begin
                case (army_6_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[7][55] && h_cnt>=Army_Instance[7][51:42] && h_cnt<Army_Instance[7][51:42]+army_7_pixel_value[18:12] && v_cnt>=Army_Instance[7][41:32] && v_cnt<Army_Instance[7][41:32]+army_7_pixel_value[11:5] && army_7_pixel_value != 2'b11) begin
                case (army_7_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[8][55] && h_cnt>=Army_Instance[8][51:42] && h_cnt<Army_Instance[8][51:42]+army_8_pixel_value[18:12] && v_cnt>=Army_Instance[8][41:32] && v_cnt<Army_Instance[8][41:32]+army_8_pixel_value[11:5] && army_8_pixel_value != 2'b11) begin
                case (army_8_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[9][55] && h_cnt>=Army_Instance[9][51:42] && h_cnt<Army_Instance[9][51:42]+army_9_pixel_value[18:12] && v_cnt>=Army_Instance[9][41:32] && v_cnt<Army_Instance[9][41:32]+army_9_pixel_value[11:5] && army_9_pixel_value != 2'b11) begin
                case (army_9_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[10][55] && h_cnt>=Army_Instance[10][51:42] && h_cnt<Army_Instance[10][51:42]+army_10_pixel_value[18:12] && v_cnt>=Army_Instance[10][41:32] && v_cnt<Army_Instance[10][41:32]+army_10_pixel_value[11:5] && army_10_pixel_value != 2'b11) begin
                case (army_10_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[11][55] && h_cnt>=Army_Instance[11][51:42] && h_cnt<Army_Instance[11][51:42]+army_11_pixel_value[18:12] && v_cnt>=Army_Instance[11][41:32] && v_cnt<Army_Instance[11][41:32]+army_11_pixel_value[11:5] && army_11_pixel_value != 2'b11) begin
                case (army_11_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[12][55] && h_cnt>=Army_Instance[12][51:42] && h_cnt<Army_Instance[12][51:42]+army_12_pixel_value[18:12] && v_cnt>=Army_Instance[12][41:32] && v_cnt<Army_Instance[12][41:32]+army_12_pixel_value[11:5] && army_12_pixel_value != 2'b11) begin
                case (army_12_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[13][55] && h_cnt>=Army_Instance[13][51:42] && h_cnt<Army_Instance[13][51:42]+army_13_pixel_value[18:12] && v_cnt>=Army_Instance[13][41:32] && v_cnt<Army_Instance[13][41:32]+army_13_pixel_value[11:5] && army_13_pixel_value != 2'b11) begin
                case (army_13_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[14][55] && h_cnt>=Army_Instance[14][51:42] && h_cnt<Army_Instance[14][51:42]+army_14_pixel_value[18:12] && v_cnt>=Army_Instance[14][41:32] && v_cnt<Army_Instance[14][41:32]+army_14_pixel_value[11:5] && army_14_pixel_value != 2'b11) begin
                case (army_14_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[15][55] && h_cnt>=Army_Instance[15][51:42] && h_cnt<Army_Instance[15][51:42]+army_15_pixel_value[18:12] && v_cnt>=Army_Instance[15][41:32] && v_cnt<Army_Instance[15][41:32]+army_15_pixel_value[11:5] && army_15_pixel_value != 2'b11) begin
                case (army_15_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[0][55] && h_cnt>=Enemy_Instance[0][51:42] && h_cnt<Enemy_Instance[0][51:42]+enemy_0_pixel_value[18:12] && v_cnt>=Enemy_Instance[0][41:32] && v_cnt<Enemy_Instance[0][41:32]+enemy_0_pixel_value[11:5] && enemy_0_pixel_value != 2'b11) begin
                case (enemy_0_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[1][55] && h_cnt>=Enemy_Instance[1][51:42] && h_cnt<Enemy_Instance[1][51:42]+enemy_1_pixel_value[18:12] && v_cnt>=Enemy_Instance[1][41:32] && v_cnt<Enemy_Instance[1][41:32]+enemy_1_pixel_value[11:5] && enemy_1_pixel_value != 2'b11) begin
                case (enemy_1_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[2][55] && h_cnt>=Enemy_Instance[2][51:42] && h_cnt<Enemy_Instance[2][51:42]+enemy_2_pixel_value[18:12] && v_cnt>=Enemy_Instance[2][41:32] && v_cnt<Enemy_Instance[2][41:32]+enemy_2_pixel_value[11:5] && enemy_2_pixel_value != 2'b11) begin
                case (enemy_2_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[3][55] && h_cnt>=Enemy_Instance[3][51:42] && h_cnt<Enemy_Instance[3][51:42]+enemy_3_pixel_value[18:12] && v_cnt>=Enemy_Instance[3][41:32] && v_cnt<Enemy_Instance[3][41:32]+enemy_3_pixel_value[11:5] && enemy_3_pixel_value != 2'b11) begin
                case (enemy_3_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[4][55] && h_cnt>=Enemy_Instance[4][51:42] && h_cnt<Enemy_Instance[4][51:42]+enemy_4_pixel_value[18:12] && v_cnt>=Enemy_Instance[4][41:32] && v_cnt<Enemy_Instance[4][41:32]+enemy_4_pixel_value[11:5] && enemy_4_pixel_value != 2'b11) begin
                case (enemy_4_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[5][55] && h_cnt>=Enemy_Instance[5][51:42] && h_cnt<Enemy_Instance[5][51:42]+enemy_5_pixel_value[18:12] && v_cnt>=Enemy_Instance[5][41:32] && v_cnt<Enemy_Instance[5][41:32]+enemy_5_pixel_value[11:5] && enemy_5_pixel_value != 2'b11) begin
                case (enemy_5_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[6][55] && h_cnt>=Enemy_Instance[6][51:42] && h_cnt<Enemy_Instance[6][51:42]+enemy_6_pixel_value[18:12] && v_cnt>=Enemy_Instance[6][41:32] && v_cnt<Enemy_Instance[6][41:32]+enemy_6_pixel_value[11:5] && enemy_6_pixel_value != 2'b11) begin
                case (enemy_6_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[7][55] && h_cnt>=Enemy_Instance[7][51:42] && h_cnt<Enemy_Instance[7][51:42]+enemy_7_pixel_value[18:12] && v_cnt>=Enemy_Instance[7][41:32] && v_cnt<Enemy_Instance[7][41:32]+enemy_7_pixel_value[11:5] && enemy_7_pixel_value != 2'b11) begin
                case (enemy_7_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[8][55] && h_cnt>=Enemy_Instance[8][51:42] && h_cnt<Enemy_Instance[8][51:42]+enemy_8_pixel_value[18:12] && v_cnt>=Enemy_Instance[8][41:32] && v_cnt<Enemy_Instance[8][41:32]+enemy_8_pixel_value[11:5] && enemy_8_pixel_value != 2'b11) begin
                case (enemy_8_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[9][55] && h_cnt>=Enemy_Instance[9][51:42] && h_cnt<Enemy_Instance[9][51:42]+enemy_9_pixel_value[18:12] && v_cnt>=Enemy_Instance[9][41:32] && v_cnt<Enemy_Instance[9][41:32]+enemy_9_pixel_value[11:5] && enemy_9_pixel_value != 2'b11) begin
                case (enemy_9_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[10][55] && h_cnt>=Enemy_Instance[10][51:42] && h_cnt<Enemy_Instance[10][51:42]+enemy_10_pixel_value[18:12] && v_cnt>=Enemy_Instance[10][41:32] && v_cnt<Enemy_Instance[10][41:32]+enemy_10_pixel_value[11:5] && enemy_10_pixel_value != 2'b11) begin
                case (enemy_10_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[11][55] && h_cnt>=Enemy_Instance[11][51:42] && h_cnt<Enemy_Instance[11][51:42]+enemy_11_pixel_value[18:12] && v_cnt>=Enemy_Instance[11][41:32] && v_cnt<Enemy_Instance[11][41:32]+enemy_11_pixel_value[11:5] && enemy_11_pixel_value != 2'b11) begin
                case (enemy_11_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[12][55] && h_cnt>=Enemy_Instance[12][51:42] && h_cnt<Enemy_Instance[12][51:42]+enemy_12_pixel_value[18:12] && v_cnt>=Enemy_Instance[12][41:32] && v_cnt<Enemy_Instance[12][41:32]+enemy_12_pixel_value[11:5] && enemy_12_pixel_value != 2'b11) begin
                case (enemy_12_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[13][55] && h_cnt>=Enemy_Instance[13][51:42] && h_cnt<Enemy_Instance[13][51:42]+enemy_13_pixel_value[18:12] && v_cnt>=Enemy_Instance[13][41:32] && v_cnt<Enemy_Instance[13][41:32]+enemy_13_pixel_value[11:5] && enemy_13_pixel_value != 2'b11) begin
                case (enemy_13_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[14][55] && h_cnt>=Enemy_Instance[14][51:42] && h_cnt<Enemy_Instance[14][51:42]+enemy_14_pixel_value[18:12] && v_cnt>=Enemy_Instance[14][41:32] && v_cnt<Enemy_Instance[14][41:32]+enemy_14_pixel_value[11:5] && enemy_14_pixel_value != 2'b11) begin
                case (enemy_14_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[15][55] && h_cnt>=Enemy_Instance[15][51:42] && h_cnt<Enemy_Instance[15][51:42]+enemy_15_pixel_value[18:12] && v_cnt>=Enemy_Instance[15][41:32] && v_cnt<Enemy_Instance[15][41:32]+enemy_15_pixel_value[11:5] && enemy_15_pixel_value != 2'b11) begin
                case (enemy_15_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt>=10'd10 && h_cnt<10'd70 && v_cnt>=10'd90 && v_cnt<10'd210 && tower_enemy_value!=2'b11) begin
                case (tower_enemy_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt>=10'd570 && h_cnt<10'd630 && v_cnt>=10'd90 && v_cnt<10'd210 && tower_cat_value!=2'b11) begin
                case (tower_cat_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (v_cnt>=10'd170 && v_cnt<10'd230) begin
                pixel = 12'hda5;    // path
            end else if (v_cnt>=10'd140) begin
                pixel = 12'h5b2;    // grass
            end else begin
                pixel = 12'h2bf;    // sky
            end
        end else begin              // simply cut half, this is lower half (board) for shortening Circuit Longest Length
            if (h_cnt>=10'd105 && h_cnt<10'd205 && v_cnt>=10'd290 && v_cnt<10'd370) begin
                case (frame_joker_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt>=10'd215 && h_cnt<10'd315 && v_cnt>=10'd290 && v_cnt<10'd370) begin
                case (frame_fish_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt>=10'd325 && h_cnt<10'd425 && v_cnt>=10'd290 && v_cnt<10'd370) begin
                case (frame_trap_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt>=10'd435 && h_cnt<10'd535 && v_cnt>=10'd290 && v_cnt<10'd370) begin
                case (frame_jay_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt>=10'd105 && h_cnt<10'd205 && v_cnt>=10'd380 && v_cnt<10'd460) begin
                case (frame_bomb_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt>=10'd215 && h_cnt<10'd315 && v_cnt>=10'd380 && v_cnt<10'd460) begin
                case (frame_CY_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt>=10'd325 && h_cnt<10'd425 && v_cnt>=10'd380 && v_cnt<10'd460) begin
                case (frame_hacker_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt>=10'd435 && h_cnt<10'd535 && v_cnt>=10'd380 && v_cnt<10'd460) begin
                case (frame_elephant_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt<10'd100 && v_cnt>=10'd380 && btn_purse_value!=2'b11) begin
                case (btn_purse_value)      // purse
                    2'b00: pixel = 12'ha63;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt>=10'd540 && v_cnt>=10'd380 && btn_fire_value!=2'b11) begin
                case (btn_fire_value)       // fire
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (v_cnt>=10'd270) begin
                pixel = 12'hfb7;    // board
            end 
        end
    end
endmodule