`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2023 07:34:24
// Design Name: 
// Module Name: pipesadder
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


module pipesadder(input clk,
input rst,
input [31:0]a,
input [31:0]b,
input cin,
output reg[31:0]sum,
output reg cout
 );
 reg [31:0] a_r,b_r;
 reg c_in;
 wire [31:0] s_r;
 wire c_r;
 addthirtytwobit uut(.a(a_r), .b(b_r), .cin(c_in), .sum(s_r), .cout(c_r));
 always @ (posedge clk or posedge rst) begin
 if(rst)
 begin
 a_r<=32'b00000000000000000000000000000000;
 b_r<=32'b00000000000000000000000000000000;
 c_in<=1'b00000000000000000000000000000000;
 end
 else
 begin
 a_r<=a;
 b_r<=b;
 c_in<=cin;
 sum<=s_r;
 cout<=c_r;
 end
 end
endmodule


  
