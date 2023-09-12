`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2023 22:06:43
// Design Name: 
// Module Name: biteightmultiplier
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

`define M ACC[0]
 module biteightmultiplier(Clk, St, Mplier, Mcand, Done, Result);
 input Clk;
 input St;
 input[7:0] Mplier;
 input[7:0] Mcand;
 output Done;
 output[15:0] Result;
 reg[7:0] State;
 reg[16:0] ACC;
 initial
 begin
 State = 0;
 ACC = 0;
 end
 always @(posedge Clk)
 begin
 case (State)
 0 :
 begin
 if (St ==1'b1)
 begin
 ACC[16:8] <= 5'b00000 ;
 ACC[7:0] <= Mplier ;
 State <= 1 ;
 end
 end
 1, 3, 5, 7, 9, 11, 13, 15:
       begin
 if (`M == 1'b1)
 begin
 ACC[16:8] <= {1'b0, ACC[15:8]} + Mcand ;
 State <= State + 1 ;
 end
 else
 begin
 ACC <= {1'b0, ACC[16:1]} ;
State <= State + 2 ;
 end
 end
 2, 4, 6, 8, 10, 12, 14, 16 :
 begin
 ACC <= {1'b0, ACC[16:1]} ;
 State <= State + 1 ;
 end
 17 :
 begin
 State <= 0 ;
 end
 endcase
 end
 assign Done = (State == 17) ? 1'b1 : 1'b0 ;
 assign Result = (State == 17) ? ACC[15:0] : 16'b0101010100000 ;
endmodule

    

