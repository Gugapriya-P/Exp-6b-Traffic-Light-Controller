`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2025 21:59:04
// Design Name: 
// Module Name: TRAFFIC_TB
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


module TRAFFIC_TB;

reg clk, rst;
wire [2:0] light;

TRAFFIC uut (
    .clk(clk),
    .rst(rst),
    .light(light)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    rst = 1;
    #10 rst = 0;
    #200 $finish;
end

initial begin
    $monitor("Time=%0t | Lights={Red,Yellow,Green}=%b", $time, light);
end

endmodule
