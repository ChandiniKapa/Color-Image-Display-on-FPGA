`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2019 04:31:41 PM
// Design Name: 
// Module Name: suryah
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


module suryah(clk,clr,hcntd,hcntde,hcntdeb,hcntdebc,rollover,column_out);
input clk,clr;
output hcntd,hcntde,hcntdeb,hcntdebc,rollover;
output reg [9:0] column_out;
reg [19:0] column_out_ns;
//output reg [9:0] column_out;
//reg [9:0] column_out_ns;
always@(posedge clk)
begin
if(clr)
column_out <= 10'b0;
else 
column_out <= column_out_ns;
end
always@(column_out)
begin
if(column_out == 800)
column_out_ns = 10'b0;
else
column_out_ns = column_out  + 10'b1;
end
assign hcntd = column_out == 640;
assign hcntde = column_out == 660;
assign hcntdeb = column_out == 755;
assign hcntdebc = column_out == 800;
assign rollover = column_out == 800;
/*assign hcntd = column_out == 1920;
assign hcntde = column_out == 1940;
assign hcntdeb = column_out == 1870;
assign hcntdebc = column_out == 2400;
assign rollover = column_out == 2400;
*/endmodule
