`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2019 04:31:52 PM
// Design Name: 
// Module Name: suryav
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


module suryav(clk,clr ,vcntr,vcntrs,vcntrsp,vcntrspq,row_out);
input clk,clr;
output vcntr,vcntrs,vcntrsp,vcntrspq;
output reg [9:0] row_out;
reg [9:0] row_out_ns;
always@(posedge clk,posedge clr)
begin
if(clr)
row_out <= 10'b0;
else
row_out <= row_out_ns;
end
always@(row_out)
begin
if(row_out == 528)
row_out_ns = 0;
else
row_out_ns = row_out + 1;
end
/*assign vcntr = row_out == 1080;
assign vcntrs = row_out == 1094;
assign vcntrsp = row_out == 1096;
assign vcntrspq = row_out == 1129;*/
assign vcntr = row_out == 480;
assign vcntrs = row_out == 494;
assign vcntrsp = row_out == 496;
assign vcntrspq = row_out == 528;
endmodule
