// `define W_PP 18:12
// `define H_PP 11:5
// `define D_PP 4:0

// `define       EXIST_P  55
// `define        TYPE_P  54:52
// `define           X_P  51:42
// `define           Y_P  41:32
// `define          HP_P  31:20
// `define       STATE_P  19:16
// `define   STATE_CNT_P  15:12
// `define  BE_DAMAGED_P  11:0

`define TOWER_CNT_MAX 8'd255

module Render_Play (
    input rst,
    input pause,
    input clk,
    input clk_25MHz,
    input [2:0] scene,
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
    input [5:0] towerBlood_E_tr,
    input [5:0] towerBlood_A_tr,
    input [55:0] Enemy_Instance [7:0],
    input [55:0] Army_Instance [7:0],
    input [4:0] genArmyCD [7:0],
    input ableToUpgrade,
    input [14:0] money,
    input [2:0] purse_level,
    input [7:0] tower_cnt,
    input [9:0] mouseInFrame,
    input twinkle,
    output reg [11:0] pixel
);

    wire [18:0] enemy_0_pixel_value, enemy_1_pixel_value;
    wire  [2:0] enemy_0_picNum, enemy_1_picNum;
    wire [11:0] enemy_0_diff = enemy_0_pixel_value[18:12] * enemy_0_pixel_value[11:5] * enemy_0_picNum;
    wire [11:0] enemy_1_diff = enemy_1_pixel_value[18:12] * enemy_1_pixel_value[11:5] * enemy_1_picNum;
    Enemy_Pixel EnemyPixel0 (Enemy_Instance[0][54:52], enemy_0_pixel_value);
    Enemy_Pixel EnemyPixel1 (Enemy_Instance[1][54:52], enemy_1_pixel_value);
    PicNum_By_State PicNum_By_State0 (Enemy_Instance[0][19:16], Enemy_Instance[0][46], enemy_0_picNum);
    PicNum_By_State PicNum_By_State1 (Enemy_Instance[1][19:16], Enemy_Instance[1][46], enemy_1_picNum);
    reg [11:0] enemy_0_pp00, enemy_0_pp01, enemy_0_pp10, enemy_0_pp11, enemy_0_pp2;
    reg [11:0] enemy_1_pp00, enemy_1_pp01, enemy_1_pp10, enemy_1_pp11, enemy_1_pp2;
    wire [1:0] enemy_0_value, enemy_1_value;
    always @(posedge clk_25MHz) begin
        enemy_0_pp00 <= ((v_cnt_5 - Enemy_Instance[0][41:32]) >> 1);
        enemy_0_pp01 <= ((h_cnt_5 - Enemy_Instance[0][51:42]) >> 1);
        enemy_0_pp10 <= enemy_0_pp00 * enemy_0_pixel_value[18:12];
        enemy_0_pp11 <= enemy_0_pp01 + enemy_0_diff;
        enemy_0_pp2 <= (enemy_0_pp10 + enemy_0_pp11);
    end
    always @(posedge clk_25MHz) begin
        enemy_1_pp00 <= ((v_cnt_5 - Enemy_Instance[1][41:32]) >> 1);
        enemy_1_pp01 <= ((h_cnt_5 - Enemy_Instance[1][51:42]) >> 1);
        enemy_1_pp10 <= enemy_1_pp00 * enemy_1_pixel_value[18:12];
        enemy_1_pp11 <= enemy_1_pp01 + enemy_1_diff;
        enemy_1_pp2 <= (enemy_1_pp10 + enemy_1_pp11);
    end
    Enemy_Render_Pixel Enemy_Render_01 (.clk(clk_25MHz), 
        .type_a(Enemy_Instance[0][54:52]), .addr_a(enemy_0_pp2), .pixel_value_a(enemy_0_value),
        .type_b(Enemy_Instance[1][54:52]), .addr_b(enemy_1_pp2), .pixel_value_b(enemy_1_value));

    wire [18:0] enemy_2_pixel_value, enemy_3_pixel_value;
    wire  [2:0] enemy_2_picNum, enemy_3_picNum;
    wire [11:0] enemy_2_diff = enemy_2_pixel_value[18:12] * enemy_2_pixel_value[11:5] * enemy_2_picNum;
    wire [11:0] enemy_3_diff = enemy_3_pixel_value[18:12] * enemy_3_pixel_value[11:5] * enemy_3_picNum;
    Enemy_Pixel EnemyPixel2 (Enemy_Instance[2][54:52], enemy_2_pixel_value);
    Enemy_Pixel EnemyPixel3 (Enemy_Instance[3][54:52], enemy_3_pixel_value);
    PicNum_By_State PicNum_By_State2 (Enemy_Instance[2][19:16], Enemy_Instance[2][46], enemy_2_picNum);
    PicNum_By_State PicNum_By_State3 (Enemy_Instance[3][19:16], Enemy_Instance[3][46], enemy_3_picNum);
    reg [11:0] enemy_2_pp00, enemy_2_pp01, enemy_2_pp10, enemy_2_pp11, enemy_2_pp2;
    reg [11:0] enemy_3_pp00, enemy_3_pp01, enemy_3_pp10, enemy_3_pp11, enemy_3_pp2;
    wire [1:0] enemy_2_value, enemy_3_value;
    always @(posedge clk_25MHz) begin
        enemy_2_pp00 <= ((v_cnt_5 - Enemy_Instance[2][41:32]) >> 1);
        enemy_2_pp01 <= ((h_cnt_5 - Enemy_Instance[2][51:42]) >> 1);
        enemy_2_pp10 <= enemy_2_pp00 * enemy_2_pixel_value[18:12];
        enemy_2_pp11 <= enemy_2_pp01 + enemy_2_diff;
        enemy_2_pp2 <= (enemy_2_pp10 + enemy_2_pp11);
    end
    always @(posedge clk_25MHz) begin
        enemy_3_pp00 <= ((v_cnt_5 - Enemy_Instance[3][41:32]) >> 1);
        enemy_3_pp01 <= ((h_cnt_5 - Enemy_Instance[3][51:42]) >> 1);
        enemy_3_pp10 <= enemy_3_pp00 * enemy_3_pixel_value[18:12];
        enemy_3_pp11 <= enemy_3_pp01 + enemy_3_diff;
        enemy_3_pp2 <= (enemy_3_pp10 + enemy_3_pp11);
    end
    Enemy_Render_Pixel Enemy_Render_23 (.clk(clk_25MHz), 
        .type_a(Enemy_Instance[2][54:52]), .addr_a(enemy_2_pp2), .pixel_value_a(enemy_2_value),
        .type_b(Enemy_Instance[3][54:52]), .addr_b(enemy_3_pp2), .pixel_value_b(enemy_3_value));

    wire [18:0] enemy_4_pixel_value, enemy_5_pixel_value;
    wire  [2:0] enemy_4_picNum, enemy_5_picNum;
    wire [11:0] enemy_4_diff = enemy_4_pixel_value[18:12] * enemy_4_pixel_value[11:5] * enemy_4_picNum;
    wire [11:0] enemy_5_diff = enemy_5_pixel_value[18:12] * enemy_5_pixel_value[11:5] * enemy_5_picNum;
    Enemy_Pixel EnemyPixel4 (Enemy_Instance[4][54:52], enemy_4_pixel_value);
    Enemy_Pixel EnemyPixel5 (Enemy_Instance[5][54:52], enemy_5_pixel_value);
    PicNum_By_State PicNum_By_State4 (Enemy_Instance[4][19:16], Enemy_Instance[4][46], enemy_4_picNum);
    PicNum_By_State PicNum_By_State5 (Enemy_Instance[5][19:16], Enemy_Instance[5][46], enemy_5_picNum);
    reg [11:0] enemy_4_pp00, enemy_4_pp01, enemy_4_pp10, enemy_4_pp11, enemy_4_pp2;
    reg [11:0] enemy_5_pp00, enemy_5_pp01, enemy_5_pp10, enemy_5_pp11, enemy_5_pp2;
    wire [1:0] enemy_4_value, enemy_5_value;
    always @(posedge clk_25MHz) begin
        enemy_4_pp00 <= ((v_cnt_5 - Enemy_Instance[4][41:32]) >> 1);
        enemy_4_pp01 <= ((h_cnt_5 - Enemy_Instance[4][51:42]) >> 1);
        enemy_4_pp10 <= enemy_4_pp00 * enemy_4_pixel_value[18:12];
        enemy_4_pp11 <= enemy_4_pp01 + enemy_4_diff;
        enemy_4_pp2 <= (enemy_4_pp10 + enemy_4_pp11);
    end
    always @(posedge clk_25MHz) begin
        enemy_5_pp00 <= ((v_cnt_5 - Enemy_Instance[5][41:32]) >> 1);
        enemy_5_pp01 <= ((h_cnt_5 - Enemy_Instance[5][51:42]) >> 1);
        enemy_5_pp10 <= enemy_5_pp00 * enemy_5_pixel_value[18:12];
        enemy_5_pp11 <= enemy_5_pp01 + enemy_5_diff;
        enemy_5_pp2 <= (enemy_5_pp10 + enemy_5_pp11);
    end
    Enemy_Render_Pixel Enemy_Render_45 (.clk(clk_25MHz), 
        .type_a(Enemy_Instance[4][54:52]), .addr_a(enemy_4_pp2), .pixel_value_a(enemy_4_value),
        .type_b(Enemy_Instance[5][54:52]), .addr_b(enemy_5_pp2), .pixel_value_b(enemy_5_value));

    wire [18:0] enemy_6_pixel_value, enemy_7_pixel_value;
    wire  [2:0] enemy_6_picNum, enemy_7_picNum;
    wire [11:0] enemy_6_diff = enemy_6_pixel_value[18:12] * enemy_6_pixel_value[11:5] * enemy_6_picNum;
    wire [11:0] enemy_7_diff = enemy_7_pixel_value[18:12] * enemy_7_pixel_value[11:5] * enemy_7_picNum;
    Enemy_Pixel EnemyPixel6 (Enemy_Instance[6][54:52], enemy_6_pixel_value);
    Enemy_Pixel EnemyPixel7 (Enemy_Instance[7][54:52], enemy_7_pixel_value);
    PicNum_By_State PicNum_By_State6 (Enemy_Instance[6][19:16], Enemy_Instance[6][46], enemy_6_picNum);
    PicNum_By_State PicNum_By_State7 (Enemy_Instance[7][19:16], Enemy_Instance[7][46], enemy_7_picNum);
    reg [11:0] enemy_6_pp00, enemy_6_pp01, enemy_6_pp10, enemy_6_pp11, enemy_6_pp2;
    reg [11:0] enemy_7_pp00, enemy_7_pp01, enemy_7_pp10, enemy_7_pp11, enemy_7_pp2;
    wire [1:0] enemy_6_value, enemy_7_value;
    always @(posedge clk_25MHz) begin
        enemy_6_pp00 <= ((v_cnt_5 - Enemy_Instance[6][41:32]) >> 1);
        enemy_6_pp01 <= ((h_cnt_5 - Enemy_Instance[6][51:42]) >> 1);
        enemy_6_pp10 <= enemy_6_pp00 * enemy_6_pixel_value[18:12];
        enemy_6_pp11 <= enemy_6_pp01 + enemy_6_diff;
        enemy_6_pp2 <= (enemy_6_pp10 + enemy_6_pp11);
    end
    always @(posedge clk_25MHz) begin
        enemy_7_pp00 <= ((v_cnt_5 - Enemy_Instance[7][41:32]) >> 1);
        enemy_7_pp01 <= ((h_cnt_5 - Enemy_Instance[7][51:42]) >> 1);
        enemy_7_pp10 <= enemy_7_pp00 * enemy_7_pixel_value[18:12];
        enemy_7_pp11 <= enemy_7_pp01 + enemy_7_diff;
        enemy_7_pp2 <= (enemy_7_pp10 + enemy_7_pp11);
    end
    Enemy_Render_Pixel Enemy_Render_67 (.clk(clk_25MHz), 
        .type_a(Enemy_Instance[6][54:52]), .addr_a(enemy_6_pp2), .pixel_value_a(enemy_6_value),
        .type_b(Enemy_Instance[7][54:52]), .addr_b(enemy_7_pp2), .pixel_value_b(enemy_7_value));



    wire [18:0] army_0_pixel_value, army_1_pixel_value;
    wire  [2:0] army_0_picNum, army_1_picNum;
    wire [12:0] army_0_diff = army_0_pixel_value[18:12] * army_0_pixel_value[11:5] * army_0_picNum;
    wire [12:0] army_1_diff = army_1_pixel_value[18:12] * army_1_pixel_value[11:5] * army_1_picNum;
    Army_Pixel ArmyPixel0 (Army_Instance[0][54:52], army_0_pixel_value);
    Army_Pixel ArmyPixel1 (Army_Instance[1][54:52], army_1_pixel_value);
    PicNum_By_State PicNum_By_State0_ (Army_Instance[0][19:16], Army_Instance[0][46], army_0_picNum);
    PicNum_By_State PicNum_By_State1_ (Army_Instance[1][19:16], Army_Instance[1][46], army_1_picNum);
    reg [12:0] army_0_pp00, army_0_pp01, army_0_pp10, army_0_pp11, army_0_pp2;
    reg [12:0] army_1_pp00, army_1_pp01, army_1_pp10, army_1_pp11, army_1_pp2;
    wire [1:0] army_0_value, army_1_value;
    always @(posedge clk_25MHz) begin
        army_0_pp00 <= ((v_cnt_5 - Army_Instance[0][41:32]) >> 1);
        army_0_pp01 <= ((h_cnt_5 - Army_Instance[0][51:42]) >> 1);
        army_0_pp10 <= army_0_pp00 * army_0_pixel_value[18:12];
        army_0_pp11 <= army_0_pp01 + army_0_diff;
        army_0_pp2 <= (army_0_pp10 + army_0_pp11);
    end
    always @(posedge clk_25MHz) begin
        army_1_pp00 <= ((v_cnt_5 - Army_Instance[1][41:32]) >> 1);
        army_1_pp01 <= ((h_cnt_5 - Army_Instance[1][51:42]) >> 1);
        army_1_pp10 <= army_1_pp00 * army_1_pixel_value[18:12];
        army_1_pp11 <= army_1_pp01 + army_1_diff;
        army_1_pp2 <= (army_1_pp10 + army_1_pp11);
    end
    Army_Render_Pixel Army_Render_01 (.clk(clk_25MHz), 
        .type_a(Army_Instance[0][54:52]), .addr_a(army_0_pp2), .pixel_value_a(army_0_value),
        .type_b(Army_Instance[1][54:52]), .addr_b(army_1_pp2), .pixel_value_b(army_1_value));

    wire [18:0] army_2_pixel_value, army_3_pixel_value;
    wire  [2:0] army_2_picNum, army_3_picNum;
    wire [12:0] army_2_diff = army_2_pixel_value[18:12] * army_2_pixel_value[11:5] * army_2_picNum;
    wire [12:0] army_3_diff = army_3_pixel_value[18:12] * army_3_pixel_value[11:5] * army_3_picNum;
    Army_Pixel ArmyPixel2 (Army_Instance[2][54:52], army_2_pixel_value);
    Army_Pixel ArmyPixel3 (Army_Instance[3][54:52], army_3_pixel_value);
    PicNum_By_State PicNum_By_State2_ (Army_Instance[2][19:16], Army_Instance[2][46], army_2_picNum);
    PicNum_By_State PicNum_By_State3_ (Army_Instance[3][19:16], Army_Instance[3][46], army_3_picNum);
    reg [12:0] army_2_pp00, army_2_pp01, army_2_pp10, army_2_pp11, army_2_pp2;
    reg [12:0] army_3_pp00, army_3_pp01, army_3_pp10, army_3_pp11, army_3_pp2;
    wire [1:0] army_2_value, army_3_value;
    always @(posedge clk_25MHz) begin
        army_2_pp00 <= ((v_cnt_5 - Army_Instance[2][41:32]) >> 1);
        army_2_pp01 <= ((h_cnt_5 - Army_Instance[2][51:42]) >> 1);
        army_2_pp10 <= army_2_pp00 * army_2_pixel_value[18:12];
        army_2_pp11 <= army_2_pp01 + army_2_diff;
        army_2_pp2 <= (army_2_pp10 + army_2_pp11);
    end
    always @(posedge clk_25MHz) begin
        army_3_pp00 <= ((v_cnt_5 - Army_Instance[3][41:32]) >> 1);
        army_3_pp01 <= ((h_cnt_5 - Army_Instance[3][51:42]) >> 1);
        army_3_pp10 <= army_3_pp00 * army_3_pixel_value[18:12];
        army_3_pp11 <= army_3_pp01 + army_3_diff;
        army_3_pp2 <= (army_3_pp10 + army_3_pp11);
    end
    Army_Render_Pixel Army_Render_23 (.clk(clk_25MHz), 
        .type_a(Army_Instance[2][54:52]), .addr_a(army_2_pp2), .pixel_value_a(army_2_value),
        .type_b(Army_Instance[3][54:52]), .addr_b(army_3_pp2), .pixel_value_b(army_3_value));

    wire [18:0] army_4_pixel_value, army_5_pixel_value;
    wire  [2:0] army_4_picNum, army_5_picNum;
    wire [12:0] army_4_diff = army_4_pixel_value[18:12] * army_4_pixel_value[11:5] * army_4_picNum;
    wire [12:0] army_5_diff = army_5_pixel_value[18:12] * army_5_pixel_value[11:5] * army_5_picNum;
    Army_Pixel ArmyPixel4 (Army_Instance[4][54:52], army_4_pixel_value);
    Army_Pixel ArmyPixel5 (Army_Instance[5][54:52], army_5_pixel_value);
    PicNum_By_State PicNum_By_State4_ (Army_Instance[4][19:16], Army_Instance[4][46], army_4_picNum);
    PicNum_By_State PicNum_By_State5_ (Army_Instance[5][19:16], Army_Instance[5][46], army_5_picNum);
    reg [12:0] army_4_pp00, army_4_pp01, army_4_pp10, army_4_pp11, army_4_pp2;
    reg [12:0] army_5_pp00, army_5_pp01, army_5_pp10, army_5_pp11, army_5_pp2;
    wire [1:0] army_4_value, army_5_value;
    always @(posedge clk_25MHz) begin
        army_4_pp00 <= ((v_cnt_5 - Army_Instance[4][41:32]) >> 1);
        army_4_pp01 <= ((h_cnt_5 - Army_Instance[4][51:42]) >> 1);
        army_4_pp10 <= army_4_pp00 * army_4_pixel_value[18:12];
        army_4_pp11 <= army_4_pp01 + army_4_diff;
        army_4_pp2 <= (army_4_pp10 + army_4_pp11);
    end
    always @(posedge clk_25MHz) begin
        army_5_pp00 <= ((v_cnt_5 - Army_Instance[5][41:32]) >> 1);
        army_5_pp01 <= ((h_cnt_5 - Army_Instance[5][51:42]) >> 1);
        army_5_pp10 <= army_5_pp00 * army_5_pixel_value[18:12];
        army_5_pp11 <= army_5_pp01 + army_5_diff;
        army_5_pp2 <= (army_5_pp10 + army_5_pp11);
    end
    Army_Render_Pixel Army_Render_45 (.clk(clk_25MHz), 
        .type_a(Army_Instance[4][54:52]), .addr_a(army_4_pp2), .pixel_value_a(army_4_value),
        .type_b(Army_Instance[5][54:52]), .addr_b(army_5_pp2), .pixel_value_b(army_5_value));

    wire [18:0] army_6_pixel_value, army_7_pixel_value;
    wire  [2:0] army_6_picNum, army_7_picNum;
    wire [12:0] army_6_diff = army_6_pixel_value[18:12] * army_6_pixel_value[11:5] * army_6_picNum;
    wire [12:0] army_7_diff = army_7_pixel_value[18:12] * army_7_pixel_value[11:5] * army_7_picNum;
    Army_Pixel ArmyPixel6 (Army_Instance[6][54:52], army_6_pixel_value);
    Army_Pixel ArmyPixel7 (Army_Instance[7][54:52], army_7_pixel_value);
    PicNum_By_State PicNum_By_State6_ (Army_Instance[6][19:16], Army_Instance[6][46], army_6_picNum);
    PicNum_By_State PicNum_By_State7_ (Army_Instance[7][19:16], Army_Instance[7][46], army_7_picNum);
    reg [12:0] army_6_pp00, army_6_pp01, army_6_pp10, army_6_pp11, army_6_pp2;
    reg [12:0] army_7_pp00, army_7_pp01, army_7_pp10, army_7_pp11, army_7_pp2;
    wire [1:0] army_6_value, army_7_value;
    always @(posedge clk_25MHz) begin
        army_6_pp00 <= ((v_cnt_5 - Army_Instance[6][41:32]) >> 1);
        army_6_pp01 <= ((h_cnt_5 - Army_Instance[6][51:42]) >> 1);
        army_6_pp10 <= army_6_pp00 * army_6_pixel_value[18:12];
        army_6_pp11 <= army_6_pp01 + army_6_diff;
        army_6_pp2 <= (army_6_pp10 + army_6_pp11);
    end
    always @(posedge clk_25MHz) begin
        army_7_pp00 <= ((v_cnt_5 - Army_Instance[7][41:32]) >> 1);
        army_7_pp01 <= ((h_cnt_5 - Army_Instance[7][51:42]) >> 1);
        army_7_pp10 <= army_7_pp00 * army_7_pixel_value[18:12];
        army_7_pp11 <= army_7_pp01 + army_7_diff;
        army_7_pp2 <= (army_7_pp10 + army_7_pp11);
    end
    Army_Render_Pixel Army_Render_67 (.clk(clk_25MHz), 
        .type_a(Army_Instance[6][54:52]), .addr_a(army_6_pp2), .pixel_value_a(army_6_value),
        .type_b(Army_Instance[7][54:52]), .addr_b(army_7_pp2), .pixel_value_b(army_7_value));



    reg  [9:0] tower_enemy_pp00, tower_enemy_pp01, tower_enemy_pp10, tower_enemy_pp11, tower_enemy_pp2;
    wire [1:0] tower_enemy_value;
    always @(posedge clk_25MHz) begin
        tower_enemy_pp00 <= ((v_cnt_5-90)/3);
        tower_enemy_pp01 <= ((h_cnt_5-10)/3);
        tower_enemy_pp10 <= tower_enemy_pp00 * 20;
        tower_enemy_pp11 <= tower_enemy_pp01;
        tower_enemy_pp2 <= (tower_enemy_pp10 + tower_enemy_pp11) % 800;
    end
    mem_Tower_Enemy mem_Tower_Enemy_0 (.clka(clk_25MHz), .wea(0), .addra(tower_enemy_pp2),  .dina(0), .douta(tower_enemy_value));

    reg  [9:0] tower_army_pp00, tower_army_pp01, tower_army_pp10, tower_army_pp11, tower_army_pp2;
    wire [1:0] tower_cat_value;
    always @(posedge clk_25MHz) begin
        tower_army_pp00 <= ((v_cnt_5-90)/3);
        tower_army_pp01 <= ((h_cnt_5-570)/3);
        tower_army_pp10 <= tower_army_pp00 * 20;
        tower_army_pp11 <= tower_army_pp01;
        tower_army_pp2 <= (tower_army_pp10 + tower_army_pp11) % 800;
    end
    mem_Tower_Cat mem_Tower_Cat_0 (.clka(clk_25MHz), .wea(0), .addra(tower_army_pp2),  .dina(0), .douta(tower_cat_value));



    reg  [8:0] frame_joker_pp00, frame_joker_pp01, frame_joker_pp10, frame_joker_pp11, frame_joker_pp2;
    wire [1:0] frame_joker_value;
    always @(posedge clk_25MHz) begin
        frame_joker_pp00 <= ((v_cnt_5-290)/4);
        frame_joker_pp01 <= ((h_cnt_5-105)/4);
        frame_joker_pp10 <= frame_joker_pp00 * 25;
        frame_joker_pp11 <= frame_joker_pp01;
        frame_joker_pp2 <= (frame_joker_pp10 + frame_joker_pp11) % 500;
    end
    reg  [8:0] frame_fish_pp00, frame_fish_pp01, frame_fish_pp10, frame_fish_pp11, frame_fish_pp2;
    wire [1:0] frame_fish_value;
    always @(posedge clk_25MHz) begin
        frame_fish_pp00 <= ((v_cnt_5-290)/4);
        frame_fish_pp01 <= ((h_cnt_5-215)/4);
        frame_fish_pp10 <= frame_fish_pp00 * 25;
        frame_fish_pp11 <= frame_fish_pp01;
        frame_fish_pp2 <= (frame_fish_pp10 + frame_fish_pp11) % 500;
    end
    reg  [8:0] frame_trap_pp00, frame_trap_pp01, frame_trap_pp10, frame_trap_pp11, frame_trap_pp2;
    wire [1:0] frame_trap_value;
    always @(posedge clk_25MHz) begin
        frame_trap_pp00 <= ((v_cnt_5-290)/4);
        frame_trap_pp01 <= ((h_cnt_5-325)/4);
        frame_trap_pp10 <= frame_trap_pp00 * 25;
        frame_trap_pp11 <= frame_trap_pp01;
        frame_trap_pp2 <= (frame_trap_pp10 + frame_trap_pp11) % 500;
    end
    reg  [8:0] frame_jay_pp00, frame_jay_pp01, frame_jay_pp10, frame_jay_pp11, frame_jay_pp2;
    wire [1:0] frame_jay_value;
    always @(posedge clk_25MHz) begin
        frame_jay_pp00 <= ((v_cnt_5-290)/4);
        frame_jay_pp01 <= ((h_cnt_5-435)/4);
        frame_jay_pp10 <= frame_jay_pp00 * 25;
        frame_jay_pp11 <= frame_jay_pp01;
        frame_jay_pp2 <= (frame_jay_pp10 + frame_jay_pp11) % 500;
    end
    reg  [8:0] frame_bomb_pp00, frame_bomb_pp01, frame_bomb_pp10, frame_bomb_pp11, frame_bomb_pp2;
    wire [1:0] frame_bomb_value;
    always @(posedge clk_25MHz) begin
        frame_bomb_pp00 <= ((v_cnt_5-380)/4);
        frame_bomb_pp01 <= ((h_cnt_5-105)/4);
        frame_bomb_pp10 <= frame_bomb_pp00 * 25;
        frame_bomb_pp11 <= frame_bomb_pp01;
        frame_bomb_pp2 <= (frame_bomb_pp10 + frame_bomb_pp11) % 500;
    end
    reg  [8:0] frame_CY_pp00, frame_CY_pp01, frame_CY_pp10, frame_CY_pp11, frame_CY_pp2;
    wire [1:0] frame_CY_value;
    always @(posedge clk_25MHz) begin
        frame_CY_pp00 <= ((v_cnt_5-380)/4);
        frame_CY_pp01 <= ((h_cnt_5-215)/4);
        frame_CY_pp10 <= frame_CY_pp00 * 25;
        frame_CY_pp11 <= frame_CY_pp01;
        frame_CY_pp2 <= (frame_CY_pp10 + frame_CY_pp11) % 500;
    end
    reg  [8:0] frame_hacker_pp00, frame_hacker_pp01, frame_hacker_pp10, frame_hacker_pp11, frame_hacker_pp2;
    wire [1:0] frame_hacker_value;
    always @(posedge clk_25MHz) begin
        frame_hacker_pp00 <= ((v_cnt_5-380)/4);
        frame_hacker_pp01 <= ((h_cnt_5-325)/4);
        frame_hacker_pp10 <= frame_hacker_pp00 * 25;
        frame_hacker_pp11 <= frame_hacker_pp01;
        frame_hacker_pp2 <= (frame_hacker_pp10 + frame_hacker_pp11) % 500;
    end
    reg  [8:0] frame_elephant_pp00, frame_elephant_pp01, frame_elephant_pp10, frame_elephant_pp11, frame_elephant_pp2;
    wire [1:0] frame_elephant_value;
    always @(posedge clk_25MHz) begin
        frame_elephant_pp00 <= ((v_cnt_5-380)/4);
        frame_elephant_pp01 <= ((h_cnt_5-435)/4);
        frame_elephant_pp10 <= frame_elephant_pp00 * 25;
        frame_elephant_pp11 <= frame_elephant_pp01;
        frame_elephant_pp2 <= (frame_elephant_pp10 + frame_elephant_pp11) % 500;
    end
    mem_Frame_Joker_Cat mem_Frame_Joker_Cat (.clka(clk_25MHz), .wea(0), .addra(frame_joker_pp2), .dina(0), .douta(frame_joker_value));
    mem_Frame_Fish_Cat  mem_Frame_Fish_Cat (.clka(clk_25MHz), .wea(0), .addra(frame_fish_pp2), .dina(0), .douta(frame_fish_value));
    mem_Frame_Trap_Cat  mem_Frame_Trap_Cat (.clka(clk_25MHz), .wea(0), .addra(frame_trap_pp2), .dina(0), .douta(frame_trap_value));
    mem_Frame_Jay_Cat   mem_Frame_Jay_Cat (.clka(clk_25MHz), .wea(0), .addra(frame_jay_pp2), .dina(0), .douta(frame_jay_value));
    mem_Frame_Bomb_Cat  mem_Frame_Bomb_Cat (.clka(clk_25MHz), .wea(0), .addra(frame_bomb_pp2), .dina(0), .douta(frame_bomb_value));
    mem_Frame_CY_Cat    mem_Frame_CY_Cat (.clka(clk_25MHz), .wea(0), .addra(frame_CY_pp2), .dina(0), .douta(frame_CY_value));
    mem_Frame_Hacker_Cat mem_Frame_Hacker_Cat (.clka(clk_25MHz), .wea(0), .addra(frame_hacker_pp2), .dina(0), .douta(frame_hacker_value));
    mem_Frame_Elephant_Cat mem_Frame_Elephant_Cat (.clka(clk_25MHz), .wea(0), .addra(frame_elephant_pp2), .dina(0), .douta(frame_elephant_value));



    reg [12:0] btn_fire_pp00, btn_fire_pp01, btn_fire_pp10, btn_fire_pp11, btn_fire_pp2;
    wire [1:0] btn_fire_value;
    always @(posedge clk_25MHz) begin
        btn_fire_pp00 <= ((v_cnt_5-380)/2);
        btn_fire_pp01 <= ((h_cnt_5-540)/2);
        btn_fire_pp10 <= btn_fire_pp00 * 50;
        btn_fire_pp11 <= btn_fire_pp01 + ((tower_cnt==`TOWER_CNT_MAX) ? 2500 : 0);
        btn_fire_pp2 <= (btn_fire_pp10 + btn_fire_pp11) % 5000;
    end
    mem_Btn_Fire mem_Btn_Fire_0 (.clka(clk_25MHz), .wea(0), .addra(btn_fire_pp2),  .dina(0), .douta(btn_fire_value));

    reg [14:0] btn_purse_pp00, btn_purse_pp01, btn_purse_pp10, btn_purse_pp11, btn_purse_pp2;
    wire [14:0] btn_diff = 15'd2500*purse_level;
    wire [1:0] btn_purse_value;
    always @(posedge clk_25MHz) begin
        btn_purse_pp00 <= ((v_cnt_5-380)/2);
        btn_purse_pp01 <= ((h_cnt_5)/2);
        btn_purse_pp10 <= btn_purse_pp00 * 50;
        btn_purse_pp11 <= btn_purse_pp01 + btn_diff;
        btn_purse_pp2 <= ((btn_purse_pp10 + btn_purse_pp11)>20000 ? 0 : (btn_purse_pp10 + btn_purse_pp11));
    end
    mem_Btn_Purse mem_Btn_Purse_0 (.clka(clk_25MHz), .wea(0), .addra(btn_purse_pp2),  .dina(0), .douta(btn_purse_value));



    reg [10:0] d_LEVEL_pp00, d_LEVEL_pp01, d_LEVEL_pp10, d_LEVEL_pp11, d_LEVEL_pp2;
    wire d_LEVEL_value;
    always @(posedge clk_25MHz) begin
        d_LEVEL_pp00 <= ((v_cnt_5-10) >> 1);
        d_LEVEL_pp01 <= ((h_cnt_5-10) >> 1);
        d_LEVEL_pp10 <= d_LEVEL_pp00 * 60;
        d_LEVEL_pp11 <= d_LEVEL_pp01;
        d_LEVEL_pp2 <= (d_LEVEL_pp10 + d_LEVEL_pp11) % 1200;
    end
    mem_LEVEL mem_d_LEVEL (.clka(clk_25MHz), .wea(0), .addra(d_LEVEL_pp2),  .dina(0), .douta(d_LEVEL_value));

    reg [10:0] d_LEVEL_num_pp00, d_LEVEL_num_pp01, d_LEVEL_num_pp10, d_LEVEL_num_pp11, d_LEVEL_num_pp2;
    wire d_LEVEL_num_value;
    reg [3:0] whichSceneNum;
    reg [3:0] next_whichSceneNum;
    always @(posedge clk_25MHz) whichSceneNum <= next_whichSceneNum;
    always @(*) begin
        case (scene)
            `S_PLAY1: next_whichSceneNum = 4'd1;
            `S_PLAY2: next_whichSceneNum = 4'd2;
            `S_PLAY3: next_whichSceneNum = 4'd3;
            default: next_whichSceneNum = whichSceneNum;
        endcase
    end
    always @(posedge clk_25MHz) begin
        d_LEVEL_num_pp00 <= ((v_cnt_5-7)/3);
        d_LEVEL_num_pp01 <= ((h_cnt_5-140)/3);
        d_LEVEL_num_pp10 <= d_LEVEL_num_pp00 * 10;
        d_LEVEL_num_pp11 <= d_LEVEL_num_pp01 + whichSceneNum*150;
        d_LEVEL_num_pp2 <= (d_LEVEL_num_pp10 + d_LEVEL_num_pp11) % 1650;
    end
    mem_Numbers mem_LEVEL_Num (.clka(clk_25MHz), .wea(0), .addra(d_LEVEL_num_pp2),  .dina(0), .douta(d_LEVEL_num_value));



    reg [12:0] d_money_Max_pp00, d_money_Max_pp01, d_money_Max_pp10, d_money_Max_pp11, d_money_Max_pp2;
    wire d_money_Max_value;
    always @(posedge clk_25MHz) begin
        d_money_Max_pp00 <= ((v_cnt_5-15)/2);
        d_money_Max_pp01 <= ((h_cnt_5-525)/2);
        d_money_Max_pp10 <= d_money_Max_pp00 * 50;
        d_money_Max_pp11 <= d_money_Max_pp01 + purse_level*750;
        d_money_Max_pp2 <= (d_money_Max_pp10 + d_money_Max_pp11) % 6000;
    end
    mem_Money_Max mem_Money_Max_0 (.clka(clk_25MHz), .wea(0), .addra(d_money_Max_pp2),  .dina(0), .douta(d_money_Max_value));


    wire [3:0] ones = money % 10;
    wire [3:0] tens = (money/10) % 10;
    wire [3:0] hundreds = (money/100) % 10;
    wire [3:0] thousands = (money/1000) % 10;

    reg [10:0] d_money_num_0_pp00, d_money_num_0_pp01, d_money_num_0_pp10, d_money_num_0_pp11, d_money_num_0_pp2;
    wire d_money_num_0_value;
    always @(posedge clk_25MHz) begin
        d_money_num_0_pp00 <= ((v_cnt_5-15)/2);
        d_money_num_0_pp01 <= ((h_cnt_5-505)/2);
        d_money_num_0_pp10 <= d_money_num_0_pp00 * 10;
        d_money_num_0_pp11 <= d_money_num_0_pp01 + ones*150;
        d_money_num_0_pp2 <= (d_money_num_0_pp10 + d_money_num_0_pp11) % 1650;
    end
    mem_Numbers mem_Money_Num_0 (.clka(clk_25MHz), .wea(0), .addra(d_money_num_0_pp2),  .dina(0), .douta(d_money_num_0_value));
    
    reg [10:0] d_money_num_1_pp00, d_money_num_1_pp01, d_money_num_1_pp10, d_money_num_1_pp11, d_money_num_1_pp2;
    wire d_money_num_1_value;
    always @(posedge clk_25MHz) begin
        d_money_num_1_pp00 <= ((v_cnt_5-15)/2);
        d_money_num_1_pp01 <= ((h_cnt_5-485)/2);
        d_money_num_1_pp10 <= d_money_num_1_pp00 * 10;
        d_money_num_1_pp11 <= d_money_num_1_pp01 + (tens==0&&hundreds==0&&thousands==0?4'd10:tens)*150;
        d_money_num_1_pp2 <= (d_money_num_1_pp10 + d_money_num_1_pp11) % 1650;
    end
    mem_Numbers mem_Money_Num_1 (.clka(clk_25MHz), .wea(0), .addra(d_money_num_1_pp2),  .dina(0), .douta(d_money_num_1_value));
    
    reg [10:0] d_money_num_2_pp00, d_money_num_2_pp01, d_money_num_2_pp10, d_money_num_2_pp11, d_money_num_2_pp2;
    wire d_money_num_2_value;
    always @(posedge clk_25MHz) begin
        d_money_num_2_pp00 <= ((v_cnt_5-15)/2);
        d_money_num_2_pp01 <= ((h_cnt_5-465)/2);
        d_money_num_2_pp10 <= d_money_num_2_pp00 * 10;
        d_money_num_2_pp11 <= d_money_num_2_pp01 + + (hundreds==0&&thousands==0?4'd10:hundreds)*150;
        d_money_num_2_pp2 <= ((tens==0&&hundreds==0&&thousands==0) ? 13'd0 : (d_money_num_2_pp10 + d_money_num_2_pp11) % 1650);
    end
    mem_Numbers mem_Money_Num_2 (.clka(clk_25MHz), .wea(0), .addra(d_money_num_2_pp2),  .dina(0), .douta(d_money_num_2_value));
    
    reg [10:0] d_money_num_3_pp00, d_money_num_3_pp01, d_money_num_3_pp10, d_money_num_3_pp11, d_money_num_3_pp2;
    wire d_money_num_3_value;
    always @(posedge clk_25MHz) begin
        d_money_num_3_pp00 <= ((v_cnt_5-15)/2);
        d_money_num_3_pp01 <= ((h_cnt_5-445)/2);
        d_money_num_3_pp10 <= d_money_num_3_pp00 * 10;
        d_money_num_3_pp11 <= d_money_num_3_pp01 + (thousands==0?4'd10:thousands)*150;
        d_money_num_3_pp2 <= ((hundreds==0&&thousands==0) ? 13'd0 : (d_money_num_3_pp10 + d_money_num_3_pp11) % 1650);
    end
    mem_Numbers mem_Money_Num_3 (.clka(clk_25MHz), .wea(0), .addra(d_money_num_3_pp2),  .dina(0), .douta(d_money_num_3_value));

    reg [10:0] d_money_num_4_pp00, d_money_num_4_pp01, d_money_num_4_pp10, d_money_num_4_pp11, d_money_num_4_pp2;
    wire d_money_num_4_value;
    always @(posedge clk_25MHz) begin
        d_money_num_4_pp00 <= ((v_cnt_5-15)/2);
        d_money_num_4_pp01 <= ((h_cnt_5-425)/2);
        d_money_num_4_pp10 <= d_money_num_4_pp00 * 10;
        d_money_num_4_pp11 <= d_money_num_4_pp01 + 1500;
        d_money_num_4_pp2 <= ((thousands==0) ? 13'd0 : (d_money_num_4_pp10 + d_money_num_4_pp11) % 1650);
    end
    mem_Numbers mem_Money_Num_4 (.clka(clk_25MHz), .wea(0), .addra(d_money_num_4_pp2),  .dina(0), .douta(d_money_num_4_value));


    wire isEnemyFull = (Enemy_Instance[0][55]&&Enemy_Instance[1][55]&&Enemy_Instance[2][55]&&Enemy_Instance[3][55]&&
                        Enemy_Instance[4][55]&&Enemy_Instance[5][55]&&Enemy_Instance[6][55]&&Enemy_Instance[7][55]);
    wire isArmyFull = (Army_Instance[0][55]&&Army_Instance[1][55]&&Army_Instance[2][55]&&Army_Instance[3][55]&&
                        Army_Instance[4][55]&&Army_Instance[5][55]&&Army_Instance[6][55]&&Army_Instance[7][55]);


    always @(*) begin
        if (v_cnt_1<10'd50) begin
            if (h_cnt_1>=10'd300 && h_cnt_1<10'd340 && v_cnt_1>=10'd10 && v_cnt_1<10'd50 && pause==1'b1) pixel = 12'hf00;
            else if (h_cnt_1>=10'd10 && h_cnt_1<10'd130 && v_cnt_1>=10'd10 && v_cnt_1<10'd50 && d_LEVEL_value==1'b1) pixel = 12'h000;
            else if (h_cnt_1>=10'd140 && h_cnt_1<10'd170 && v_cnt_1>=10'd7 && v_cnt_1<10'd52 && d_LEVEL_num_value==1'b1) pixel = 12'h000;
            else if (h_cnt_1>=10'd525 && h_cnt_1<10'd625 && v_cnt_1>=10'd15 && v_cnt_1<10'd45 && d_money_Max_value==1'b1) pixel = 12'h000;
            else if (h_cnt_1>=10'd505 && h_cnt_1<10'd525 && v_cnt_1>=10'd15 && v_cnt_1<10'd45 && d_money_num_0_value==1'b1) pixel = 12'h000;
            else if (h_cnt_1>=10'd485 && h_cnt_1<10'd505 && v_cnt_1>=10'd15 && v_cnt_1<10'd45 && d_money_num_1_value==1'b1) pixel = 12'h000;
            else if (h_cnt_1>=10'd465 && h_cnt_1<10'd485 && v_cnt_1>=10'd15 && v_cnt_1<10'd45 && d_money_num_2_value==1'b1) pixel = 12'h000;
            else if (h_cnt_1>=10'd445 && h_cnt_1<10'd465 && v_cnt_1>=10'd15 && v_cnt_1<10'd45 && d_money_num_3_value==1'b1) pixel = 12'h000;
            else if (h_cnt_1>=10'd425 && h_cnt_1<10'd445 && v_cnt_1>=10'd15 && v_cnt_1<10'd45 && d_money_num_4_value==1'b1) pixel = 12'h000;
            else pixel = 12'h2bf;    // sky
        end else if (v_cnt_1<10'd270) begin    // simply cut half, this is upper half (gaming) for shortening Circuit Longest Length
            if (Army_Instance[0][55] && 
            h_cnt_1>=Army_Instance[0][51:42] && h_cnt_1<Army_Instance[0][51:42]+(army_0_pixel_value[18:12] << 1) && 
            v_cnt_1>=Army_Instance[0][41:32] && v_cnt_1<Army_Instance[0][41:32]+(army_0_pixel_value[11:5] << 1) && army_0_value != 2'b11) begin
                case (army_0_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[1][55] && 
            h_cnt_1>=Army_Instance[1][51:42] && h_cnt_1<Army_Instance[1][51:42]+(army_1_pixel_value[18:12] << 1) &&
            v_cnt_1>=Army_Instance[1][41:32] && v_cnt_1<Army_Instance[1][41:32]+(army_1_pixel_value[11:5] << 1) && army_1_value != 2'b11) begin
                case (army_1_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[2][55] && 
            h_cnt_1>=Army_Instance[2][51:42] && h_cnt_1<Army_Instance[2][51:42]+(army_2_pixel_value[18:12] << 1) && 
            v_cnt_1>=Army_Instance[2][41:32] && v_cnt_1<Army_Instance[2][41:32]+(army_2_pixel_value[11:5] << 1) && army_2_value != 2'b11) begin
                case (army_2_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[3][55] && 
            h_cnt_1>=Army_Instance[3][51:42] && h_cnt_1<Army_Instance[3][51:42]+(army_3_pixel_value[18:12] << 1) && 
            v_cnt_1>=Army_Instance[3][41:32] && v_cnt_1<Army_Instance[3][41:32]+(army_3_pixel_value[11:5] << 1) && army_3_value != 2'b11) begin
                case (army_3_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[4][55] && 
            h_cnt_1>=Army_Instance[4][51:42] && h_cnt_1<Army_Instance[4][51:42]+(army_4_pixel_value[18:12] << 1) && 
            v_cnt_1>=Army_Instance[4][41:32] && v_cnt_1<Army_Instance[4][41:32]+(army_4_pixel_value[11:5] << 1) && army_4_value != 2'b11) begin
                case (army_4_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[5][55] && 
            h_cnt_1>=Army_Instance[5][51:42] && h_cnt_1<Army_Instance[5][51:42]+(army_5_pixel_value[18:12] << 1) && 
            v_cnt_1>=Army_Instance[5][41:32] && v_cnt_1<Army_Instance[5][41:32]+(army_5_pixel_value[11:5] << 1) && army_5_value != 2'b11) begin
                case (army_5_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[6][55] && 
            h_cnt_1>=Army_Instance[6][51:42] && h_cnt_1<Army_Instance[6][51:42]+(army_6_pixel_value[18:12] << 1) && 
            v_cnt_1>=Army_Instance[6][41:32] && v_cnt_1<Army_Instance[6][41:32]+(army_6_pixel_value[11:5] << 1) && army_6_value != 2'b11) begin
                case (army_6_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Army_Instance[7][55] && 
            h_cnt_1>=Army_Instance[7][51:42] && h_cnt_1<Army_Instance[7][51:42]+(army_7_pixel_value[18:12] << 1) && 
            v_cnt_1>=Army_Instance[7][41:32] && v_cnt_1<Army_Instance[7][41:32]+(army_7_pixel_value[11:5] << 1) && army_7_value != 2'b11) begin
                case (army_7_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[0][55] && 
            h_cnt_1>=Enemy_Instance[0][51:42] && h_cnt_1<Enemy_Instance[0][51:42]+(enemy_0_pixel_value[18:12] << 1) && 
            v_cnt_1>=Enemy_Instance[0][41:32] && v_cnt_1<Enemy_Instance[0][41:32]+(enemy_0_pixel_value[11:5] << 1) && enemy_0_value != 2'b11) begin
                case (enemy_0_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[1][55] && 
            h_cnt_1>=Enemy_Instance[1][51:42] && h_cnt_1<Enemy_Instance[1][51:42]+(enemy_1_pixel_value[18:12] << 1) && 
            v_cnt_1>=Enemy_Instance[1][41:32] && v_cnt_1<Enemy_Instance[1][41:32]+(enemy_1_pixel_value[11:5] << 1) && enemy_1_value != 2'b11) begin
                case (enemy_1_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[2][55] && 
            h_cnt_1>=Enemy_Instance[2][51:42] && h_cnt_1<Enemy_Instance[2][51:42]+(enemy_2_pixel_value[18:12] << 1) && 
            v_cnt_1>=Enemy_Instance[2][41:32] && v_cnt_1<Enemy_Instance[2][41:32]+(enemy_2_pixel_value[11:5] << 1) && enemy_2_value != 2'b11) begin
                case (enemy_2_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[3][55] && 
            h_cnt_1>=Enemy_Instance[3][51:42] && h_cnt_1<Enemy_Instance[3][51:42]+(enemy_3_pixel_value[18:12] << 1) && 
            v_cnt_1>=Enemy_Instance[3][41:32] && v_cnt_1<Enemy_Instance[3][41:32]+(enemy_3_pixel_value[11:5] << 1) && enemy_3_value != 2'b11) begin
                case (enemy_3_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[4][55] && 
            h_cnt_1>=Enemy_Instance[4][51:42] && h_cnt_1<Enemy_Instance[4][51:42]+(enemy_4_pixel_value[18:12] << 1) && 
            v_cnt_1>=Enemy_Instance[4][41:32] && v_cnt_1<Enemy_Instance[4][41:32]+(enemy_4_pixel_value[11:5] << 1) && enemy_4_value != 2'b11) begin
                case (enemy_4_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[5][55] && 
            h_cnt_1>=Enemy_Instance[5][51:42] && h_cnt_1<Enemy_Instance[5][51:42]+(enemy_5_pixel_value[18:12] << 1) && 
            v_cnt_1>=Enemy_Instance[5][41:32] && v_cnt_1<Enemy_Instance[5][41:32]+(enemy_5_pixel_value[11:5] << 1) && enemy_5_value != 2'b11) begin
                case (enemy_5_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[6][55] && 
            h_cnt_1>=Enemy_Instance[6][51:42] && h_cnt_1<Enemy_Instance[6][51:42]+(enemy_6_pixel_value[18:12] << 1) && 
            v_cnt_1>=Enemy_Instance[6][41:32] && v_cnt_1<Enemy_Instance[6][41:32]+(enemy_6_pixel_value[11:5] << 1) && enemy_6_value != 2'b11) begin
                case (enemy_6_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (Enemy_Instance[7][55] && 
            h_cnt_1>=Enemy_Instance[7][51:42] && h_cnt_1<Enemy_Instance[7][51:42]+(enemy_7_pixel_value[18:12] << 1) && 
            v_cnt_1>=Enemy_Instance[7][41:32] && v_cnt_1<Enemy_Instance[7][41:32]+(enemy_7_pixel_value[11:5] << 1) && enemy_7_value != 2'b11) begin
                case (enemy_7_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt_1>=10'd6 && h_cnt_1<10'd74 && v_cnt_1>=10'd70 && v_cnt_1<10'd80) begin
                if (h_cnt_1>=10'd8 && h_cnt_1<10'd72 && v_cnt_1>=10'd72 && v_cnt_1<10'd78) begin
                    if (h_cnt_1 < towerBlood_E_tr + 10'd8) pixel = 12'hf59;     // enemy blood
                    else pixel = 12'h000;
                end else pixel = 12'h000;
            end else if (h_cnt_1>=10'd10 && h_cnt_1<10'd70 && v_cnt_1>=10'd90 && v_cnt_1<10'd210 && tower_enemy_value!=2'b11) begin
                case (tower_enemy_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt_1>=10'd566 && h_cnt_1<10'd634 && v_cnt_1>=10'd70 && v_cnt_1<10'd80) begin
                if (h_cnt_1>=10'd568 && h_cnt_1<10'd632 && v_cnt_1>=10'd72 && v_cnt_1<10'd78) begin
                    if (h_cnt_1 + towerBlood_A_tr >= 10'd632) pixel = 12'h38F;     // army blood
                    else pixel = 12'h000;
                end else pixel = 12'h000;
            end else if (h_cnt_1>=10'd570 && h_cnt_1<10'd630 && v_cnt_1>=10'd90 && v_cnt_1<10'd210 && tower_cat_value!=2'b11) begin
                case (tower_cat_value)
                    2'b00: pixel = 12'hfff;
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (v_cnt_1>=10'd170 && v_cnt_1<10'd230) begin
                pixel = 12'hda5;    // path
            end else if (v_cnt_1>=10'd140) begin
                pixel = 12'h5b2;    // grass
            end else begin
                pixel = 12'h2bf;    // sky
            end
        end else begin              // simply cut half, this is lower half (board) for shortening Circuit Longest Length
            if (h_cnt_1>=10'd13 && h_cnt_1<10'd87 && v_cnt_1>=10'd288 && v_cnt_1<10'd322) begin 
                if (isEnemyFull==1'b1 && twinkle==1'b1) begin
                    if (h_cnt_1>=10'd15 && h_cnt_1<10'd85 && v_cnt_1>=10'd290 && v_cnt_1<10'd320) pixel = 12'hf59;      // enemy blood
                    else pixel = 12'h000;
                end
                else if (h_cnt_1>=10'd15 && h_cnt_1<10'd25 && v_cnt_1>=10'd290 && v_cnt_1<10'd300 && Enemy_Instance[0][55]==1'b1) pixel = 12'hf6a;
                else if (h_cnt_1>=10'd13 && h_cnt_1<10'd27 && v_cnt_1>=10'd288 && v_cnt_1<10'd302 && Enemy_Instance[0][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd35 && h_cnt_1<10'd45 && v_cnt_1>=10'd290 && v_cnt_1<10'd300 && Enemy_Instance[1][55]==1'b1) pixel = 12'hf6a;
                else if (h_cnt_1>=10'd33 && h_cnt_1<10'd47 && v_cnt_1>=10'd288 && v_cnt_1<10'd302 && Enemy_Instance[1][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd55 && h_cnt_1<10'd65 && v_cnt_1>=10'd290 && v_cnt_1<10'd300 && Enemy_Instance[2][55]==1'b1) pixel = 12'hf6a;
                else if (h_cnt_1>=10'd53 && h_cnt_1<10'd67 && v_cnt_1>=10'd288 && v_cnt_1<10'd302 && Enemy_Instance[2][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd75 && h_cnt_1<10'd85 && v_cnt_1>=10'd290 && v_cnt_1<10'd300 && Enemy_Instance[3][55]==1'b1) pixel = 12'hf6a;
                else if (h_cnt_1>=10'd73 && h_cnt_1<10'd87 && v_cnt_1>=10'd288 && v_cnt_1<10'd302 && Enemy_Instance[3][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd15 && h_cnt_1<10'd25 && v_cnt_1>=10'd310 && v_cnt_1<10'd320 && Enemy_Instance[4][55]==1'b1) pixel = 12'hf6a;
                else if (h_cnt_1>=10'd13 && h_cnt_1<10'd27 && v_cnt_1>=10'd308 && v_cnt_1<10'd322 && Enemy_Instance[4][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd35 && h_cnt_1<10'd45 && v_cnt_1>=10'd310 && v_cnt_1<10'd320 && Enemy_Instance[5][55]==1'b1) pixel = 12'hf6a;
                else if (h_cnt_1>=10'd33 && h_cnt_1<10'd47 && v_cnt_1>=10'd308 && v_cnt_1<10'd322 && Enemy_Instance[5][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd55 && h_cnt_1<10'd65 && v_cnt_1>=10'd310 && v_cnt_1<10'd320 && Enemy_Instance[6][55]==1'b1) pixel = 12'hf6a;
                else if (h_cnt_1>=10'd53 && h_cnt_1<10'd67 && v_cnt_1>=10'd308 && v_cnt_1<10'd322 && Enemy_Instance[6][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd75 && h_cnt_1<10'd85 && v_cnt_1>=10'd310 && v_cnt_1<10'd320 && Enemy_Instance[7][55]==1'b1) pixel = 12'hf6a;
                else if (h_cnt_1>=10'd73 && h_cnt_1<10'd87 && v_cnt_1>=10'd308 && v_cnt_1<10'd322 && Enemy_Instance[7][55]==1'b1) pixel = 12'h000;
                else pixel = 12'hfb7;    // board
            end else if (h_cnt_1>=10'd553 && h_cnt_1<10'd627 && v_cnt_1>=10'd288 && v_cnt_1<10'd322) begin
                if (isArmyFull==1'b1 && twinkle==1'b1) begin
                    if (h_cnt_1>=10'd555 && h_cnt_1<10'd625 && v_cnt_1>=10'd290 && v_cnt_1<10'd320) pixel = 12'h38F;       // army blood
                    else pixel = 12'h000;
                end
                else if (h_cnt_1>=10'd555 && h_cnt_1<10'd565 && v_cnt_1>=10'd290 && v_cnt_1<10'd300 && Army_Instance[0][55]==1'b1) pixel = 12'h49F;
                else if (h_cnt_1>=10'd553 && h_cnt_1<10'd567 && v_cnt_1>=10'd288 && v_cnt_1<10'd302 && Army_Instance[0][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd575 && h_cnt_1<10'd585 && v_cnt_1>=10'd290 && v_cnt_1<10'd300 && Army_Instance[1][55]==1'b1) pixel = 12'h49F;
                else if (h_cnt_1>=10'd573 && h_cnt_1<10'd587 && v_cnt_1>=10'd288 && v_cnt_1<10'd302 && Army_Instance[1][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd595 && h_cnt_1<10'd605 && v_cnt_1>=10'd290 && v_cnt_1<10'd300 && Army_Instance[2][55]==1'b1) pixel = 12'h49F;
                else if (h_cnt_1>=10'd593 && h_cnt_1<10'd607 && v_cnt_1>=10'd288 && v_cnt_1<10'd302 && Army_Instance[2][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd615 && h_cnt_1<10'd625 && v_cnt_1>=10'd290 && v_cnt_1<10'd300 && Army_Instance[3][55]==1'b1) pixel = 12'h49F;
                else if (h_cnt_1>=10'd613 && h_cnt_1<10'd627 && v_cnt_1>=10'd288 && v_cnt_1<10'd302 && Army_Instance[3][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd555 && h_cnt_1<10'd565 && v_cnt_1>=10'd310 && v_cnt_1<10'd320 && Army_Instance[4][55]==1'b1) pixel = 12'h49F;
                else if (h_cnt_1>=10'd553 && h_cnt_1<10'd567 && v_cnt_1>=10'd308 && v_cnt_1<10'd322 && Army_Instance[4][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd575 && h_cnt_1<10'd585 && v_cnt_1>=10'd310 && v_cnt_1<10'd320 && Army_Instance[5][55]==1'b1) pixel = 12'h49F;
                else if (h_cnt_1>=10'd573 && h_cnt_1<10'd587 && v_cnt_1>=10'd308 && v_cnt_1<10'd322 && Army_Instance[5][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd595 && h_cnt_1<10'd605 && v_cnt_1>=10'd310 && v_cnt_1<10'd320 && Army_Instance[6][55]==1'b1) pixel = 12'h49F;
                else if (h_cnt_1>=10'd593 && h_cnt_1<10'd607 && v_cnt_1>=10'd308 && v_cnt_1<10'd322 && Army_Instance[6][55]==1'b1) pixel = 12'h000;
                else if (h_cnt_1>=10'd615 && h_cnt_1<10'd625 && v_cnt_1>=10'd310 && v_cnt_1<10'd320 && Army_Instance[7][55]==1'b1) pixel = 12'h49F;
                else if (h_cnt_1>=10'd613 && h_cnt_1<10'd627 && v_cnt_1>=10'd308 && v_cnt_1<10'd322 && Army_Instance[7][55]==1'b1) pixel = 12'h000;
                else pixel = 12'hfb7;    // board
            end else if (h_cnt_1>=10'd105 && h_cnt_1<10'd205 && v_cnt_1>=10'd290 && v_cnt_1<10'd370) begin
                case (frame_joker_value)
                    2'b00: pixel = (genArmyCD[0]==5'd0 ? 12'hfff : ((h_cnt-10'd105)>(genArmyCD[0]*3) ? 12'h666 : 12'hfff));
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt_1>=10'd215 && h_cnt_1<10'd315 && v_cnt_1>=10'd290 && v_cnt_1<10'd370) begin
                case (frame_fish_value)
                    2'b00: pixel = (genArmyCD[1]==5'd0 ? 12'hfff : ((h_cnt-10'd215)>(genArmyCD[1]*3) ? 12'h666 : 12'hfff));
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt_1>=10'd325 && h_cnt_1<10'd425 && v_cnt_1>=10'd290 && v_cnt_1<10'd370) begin
                case (frame_trap_value)
                    2'b00: pixel = (genArmyCD[2]==5'd0 ? 12'hfff : ((h_cnt-10'd325)>(genArmyCD[2]*3) ? 12'h666 : 12'hfff));
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt_1>=10'd435 && h_cnt_1<10'd535 && v_cnt_1>=10'd290 && v_cnt_1<10'd370) begin
                case (frame_jay_value)
                    2'b00: pixel = (genArmyCD[3]==5'd0 ? 12'hfff : ((h_cnt-10'd435)>(genArmyCD[3]*3) ? 12'h666 : 12'hfff));
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt_1>=10'd105 && h_cnt_1<10'd205 && v_cnt_1>=10'd380 && v_cnt_1<10'd460) begin
                case (frame_bomb_value)
                    2'b00: pixel = (genArmyCD[4]==5'd0 ? 12'hfff : ((h_cnt-10'd105)>(genArmyCD[4]*3) ? 12'h666 : 12'hfff));
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt_1>=10'd215 && h_cnt_1<10'd315 && v_cnt_1>=10'd380 && v_cnt_1<10'd460) begin
                case (frame_CY_value)
                    2'b00: pixel = (genArmyCD[5]==5'd0 ? 12'hfff : ((h_cnt-10'd215)>(genArmyCD[5]*3) ? 12'h666 : 12'hfff));
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt_1>=10'd325 && h_cnt_1<10'd425 && v_cnt_1>=10'd380 && v_cnt_1<10'd460) begin
                case (frame_hacker_value)
                    2'b00: pixel = (genArmyCD[6]==5'd0 ? 12'hfff : ((h_cnt-10'd325)>(genArmyCD[6]*3) ? 12'h666 : 12'hfff));
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt_1>=10'd435 && h_cnt_1<10'd535 && v_cnt_1>=10'd380 && v_cnt_1<10'd460) begin
                case (frame_elephant_value)
                    2'b00: pixel = (genArmyCD[7]==5'd0 ? 12'hfff : ((h_cnt-10'd435)>(genArmyCD[7]*3) ? 12'h666 : 12'hfff));
                    2'b10: pixel = 12'hf00;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt_1<10'd100 && v_cnt_1>=10'd380 && btn_purse_value!=2'b11) begin
                case (btn_purse_value)      // purse
                    2'b00: pixel = (ableToUpgrade ? 12'ha73 : 12'h666);
                    2'b10: pixel = 12'hf13;
                    default: pixel = 12'h000;
                endcase
            end else if (h_cnt_1>=10'd540 && v_cnt_1>=10'd380 && btn_fire_value!=2'b11) begin
                if (tower_cnt==`TOWER_CNT_MAX) begin
                    case (btn_fire_value)       // fire
                        2'b00: pixel = 12'hfff;
                        2'b10: pixel = 12'hf00;
                        default: pixel = 12'h000;
                    endcase
                end else begin
                    case (btn_fire_value)       // fire
                        2'b00: pixel = ((tower_cnt[7:5]*12 >= 10'd480-v_cnt_1) ? 12'hccc : 12'h666);
                        default: pixel = 12'h000;
                    endcase
                end
            end else begin
                pixel = 12'hfb7;    // board
            end 
        end
    end
endmodule