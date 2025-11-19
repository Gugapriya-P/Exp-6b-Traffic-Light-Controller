`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2025 21:58:19
// Design Name: 
// Module Name: TRAFFIC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TRAFFIC(
    input clk,
    input rst,
    output reg [2:0] light
);

parameter [1:0] RED = 2'b00,
                GREEN = 2'b01,
                YELLOW = 2'b10;

reg [1:0] state, next_state;
reg [3:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= RED;
        count <= 0;
    end
    else begin
        state <= next_state;
        count <= count + 1;
    end
end

always @(*) begin
    next_state = state;
    case (state)
        RED:    if (count == 4) next_state = GREEN;
        GREEN:  if (count == 6) next_state = YELLOW;
        YELLOW: if (count == 2) next_state = RED;
    endcase
end

always @(*) begin
    case (state)
        RED:    light = 3'b001;
        GREEN:  light = 3'b010;
        YELLOW: light = 3'b100;
        default: light = 3'b000;
    endcase
end

endmodule
