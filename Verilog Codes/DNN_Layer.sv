`timescale 1ns / 1ps

module DNN_Layer#(
        parameter ROWS = 10,
        parameter COLS = 784,
        parameter input_bit_width = 9,
        parameter output_bit_width = 9
    )(
        input wire signed [input_bit_width-1:0] input_vector [0: COLS-1],
        output wire signed [output_bit_width-1:0] output_vector [0: ROWS-1]
    );
    
    // Internal wires
    wire signed [25:0] output_vector_layer1 [0: 63]; 
    wire signed [25:0] output_vector_scale_layer1 [0: 63];
    wire signed [8:0] output_vector_relu_Layer1 [0: 63]; 
    wire signed [21:0] output_vector_layer2 [0: 63]; 
    wire signed [21:0] output_vector_scale_layer2 [0: 63];
    wire signed [8:0] output_vector_relu_Layer2 [0: 63]; 
    wire signed [21:0] output_vector_layer3 [0: 63]; 
    wire signed [21:0] output_vector_scale_layer3 [0: 63];
    wire signed [8:0] output_vector_relu_Layer3 [0: 63]; 
    wire signed [21:0] output_vector_layer4 [0: 9]; 
    
    // Layer 1
    matrix_mult_optimized_64x784_8_49770 layers1 (
        .input_vector(input_vector),
        .output_vector(output_vector_layer1)
    );

    Relu #(
        .ROWS(64),
        .COLS(784),
        .output_bit_width(26),
        .slice(18)
    ) inst1 (
        .input_data(output_vector_layer1), 
        .output_data(output_vector_relu_Layer1)
    );
    
    // Layer 2
    matrix_mult_optimized_64x64_8_5634 layers2 (
        .input_vector(output_vector_relu_Layer1),
        .output_vector(output_vector_layer2)
    );
    
    Relu #(
        .ROWS(64),
        .COLS(64),
        .output_bit_width(22),
        .slice(16)
    ) inst2 (
        .input_data(output_vector_layer2), 
        .output_data(output_vector_relu_Layer2)
    );
    
    // Layer 3
    matrix_mult_optimized_64x64_8_5487 layers3 (
        .input_vector(output_vector_relu_Layer2),
        .output_vector(output_vector_layer3)
    );

    Relu #(
        .ROWS(64),
        .COLS(64),
        .output_bit_width(22),
        .slice(16)
    ) inst3 (
        .input_data(output_vector_layer3), 
        .output_data(output_vector_relu_Layer3)
    );
    
    // Layer 4
    matrix_mult_optimized_10x64_8_1449 layers4 (
        .input_vector(output_vector_relu_Layer3),
        .output_vector(output_vector_layer4)
    );

    Relu #(
        .ROWS(10),
        .COLS(64),
        .output_bit_width(22),
        .slice(16)
    ) inst4 (
        .input_data(output_vector_layer4), 
        .output_data(output_vector)
    );
    
endmodule
