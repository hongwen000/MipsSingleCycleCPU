`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2017 01:30:03 AM
// Design Name: 
// Module Name: BranchControl
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


module BranchControl(
    input [3:0] BranchControl_Input_Type,
    output reg BranchControl_Output_Exec_Branch,
    input Sign_in,
    input Zero_in,
    input [31:0] Branch_Addr_in,
    input [31:0] Jr_Addr_in,
    output [31:0] Branch_Addr_out
    );
    assign Branch_Addr_out = (BranchControl_Input_Type == 4'b0100) ? Jr_Addr_in : Branch_Addr_in;
    always@(BranchControl_Input_Type or Sign_in or Zero_in)
    begin
        case (BranchControl_Input_Type)
            4'b0000: BranchControl_Output_Exec_Branch = 1'b0;
            4'b0001: BranchControl_Output_Exec_Branch = Zero_in;
            4'b0010: BranchControl_Output_Exec_Branch = ~Zero_in;
            4'b0011: 
            begin
                $display("INFO@[BranchControl]:Exec BGTZ:%b, %b", Sign_in, Zero_in);
                BranchControl_Output_Exec_Branch = (~Sign_in && ~Zero_in);
            end
            4'b0100: BranchControl_Output_Exec_Branch = 1'b1;
            default:
            begin
                BranchControl_Output_Exec_Branch = 1'b0;
                $display("EXCEPTION@[BranchControl]:no match Branch Type Input:%b", BranchControl_Input_Type);
            end
        endcase
    end
endmodule
