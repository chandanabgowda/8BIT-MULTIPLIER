`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2023 22:19:28
// Design Name: 
// Module Name: biteightmultipliertb
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


module biteightmultipliertb();
reg clk,st;
reg [7:0]Mplier,Mcand;
wire Done;
wire [15:0]Result;
biteightmultiplier uut (.Clk(clk),.St(st),.Mplier(Mplier),.Mcand(Mcand),.Done(Done),.Result(Result));

initial begin 
clk=0;
st=0;
Mplier=0;
Mcand=0;
#20 st=1;
Mplier=10;
Mcand=5;
#150 Mplier=64;
Mcand=72;
#1000 $finish;
end
always 
#5 clk=~clk;
endmodule
