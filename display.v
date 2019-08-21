`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2019 04:31:21 PM
// Design Name: 
// Module Name: display
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


module display(clk,rst,hsyncout,vsyncout,redout);
 input clk,rst;
 wire [9:0] column_out,row_out;
 output [11:0] redout;
 output wire hsyncout,vsyncout;
 wire hdataon;
 wire vdataon;
 wire w1hd,w1hde,w1hdeb,w1hdebc,w1rollover;
 wire w2vr,w2vrs,w2vrsp,w2vrspq;
 wire [17:0] addra;
 wire [7:0] douta;
wire clk_out,von;
clk_wiz_0 instance_namemine
   (
   // Clock in ports
    .clk_in1(clk),      // input clk_in1
    // Clock out ports
    .clk_out1(clk_out));    // output clk_out1
 
h f1 (.clk(clk_out),.clr(rst),.hcntd(w1hd),.hcntde(w1hde),.hcntdeb(w1hdeb),.hcntdebc(w1hdebc),.rollover(w1rollover),.column_out(column_out));
v f2 (.clk(w1rollover),.clr(rst),.vcntr(w2vr),.vcntrs(w2vrs),.vcntrsp(w2vrsp),.vcntrspq(w2vrspq),.row_out(row_out));
 sr f3 (.Q(hsyncout),.QBAR(),.S(w1hdeb),.R(w1hde),.CLK(clk_out));
 sr f4 (.Q(hdataon),.QBAR(),.S(w1hdebc),.R(w1hd),.CLK(clk_out));
 sr f5 (.Q(vsyncout),.QBAR(),.S(w2vrsp),.R(w2vrs),.CLK(clk_out));
 sr f6 (.Q(vdataon),.QBAR(),.S(w2vrspq),.R(w2vr),.CLK(clk_out));
 
 assign von = hdataon || vdataon; 

 assign addra = {row_out[8:0],column_out[8:0]};
  
 
 //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
 blk_mem_gen_0 your_instance_name (
   .clka(clk_out),    // input wire clka
   .addra(addra),  // input wire [15 : 0] addra
   .douta(douta)  // output wire [11 : 0] douta
 );

 assign redout = (von) ? douta : 0;
 
endmodule
