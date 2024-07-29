`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2024 10:12:51
// Design Name: 
// Module Name: Relu
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


module Relu#(
        parameter ROWS = 64,
        parameter COLS = 784,
        parameter output_bit_width = 26, 
        parameter slice = 21
        )
        (
        input_data, 
        output_data);


input signed [output_bit_width-1:0]input_data[0: ROWS-1];
output  logic [9-1:0]output_data[0: ROWS-1];
logic [output_bit_width-1:0] outTemp [0:ROWS-1];

always@* begin

    for(int i =0; i<ROWS; i++)begin
        if(input_data[i][output_bit_width-1]==0)begin 
            outTemp[i] = input_data[i];
        end else begin
            outTemp[i] = 0;
        end
    end
    
    for(int i =0; i<ROWS; i++)begin
        if(input_data[i][output_bit_width-1]==0)begin 
            output_data[i] = {1'b0,outTemp[i][slice - 1: slice-8]};
        end else begin
            output_data[i] = 0;
        end
    end
    
end



    
endmodule
