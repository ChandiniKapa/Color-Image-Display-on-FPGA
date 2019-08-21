`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2019 04:32:06 PM
// Design Name: 
// Module Name: suryasr
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


module suryasr(Q,QBAR,S,R,CLK);
input S,R;
input CLK;
output Q,QBAR;
reg  Q,QBAR;
always @(posedge CLK)
begin
        case({S,R})
        2'b00: Q<=Q;
        2'b01: Q<=0;
        2'b10: Q<=1;
        2'b11: Q<=1'bx;
        endcase
end
always @(Q) 
QBAR= ~Q;
endmodule