`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2023 22:34:25
// Design Name: 
// Module Name: pipebiteightmulti
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


module pipebiteightmulti(
    input Clk,
    input rst,
    input St,
    input [7:0]Mplier,
    input [7:0]Mcand,
    output reg Done,
    output reg [15:0]Result
    );
    reg St_d;
    reg [7:0]Mplier_d, Mcand_d;
    wire done_d;
    wire [15:0]result_d;
    biteightmultiplier uut(.Clk(Clk),.St(St_d),.Mplier(Mplier_d),.Mcand(Mcand_d),.Done(done_d),.Result(result_d));
    always @(posedge Clk or posedge rst) begin 
    if(rst) begin 
    St_d<=0;
    Mplier_d<=0;
    Mcand_d<=0;
    Done<=0;
    Result<=0;
    end
    else begin 
    St_d<=St;
    Mplier_d<=Mplier;
    Mcand_d<=Mcand;
    Done<=done_d;
    Result<=result_d;
    end
    end
endmodule
