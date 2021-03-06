`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 00:05:33
// Design Name: 
// Module Name: SignExt
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


module SignExt(
    input [15:0] Input_16,
    input Input_Zero_Ext,
    output [31:0] Output_32
    );
    assign Output_32 = Input_Zero_Ext ? {16'b0, Input_16[15:0]} : {{16{Input_16[15]}}, Input_16[15:0]};
endmodule
