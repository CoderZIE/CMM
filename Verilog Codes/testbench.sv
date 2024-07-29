`timescale 1ns / 1ps

module Testbench#(
    parameter ROWS = 10,
    parameter COLS = 784,
    parameter input_bit_width = 9,
    parameter output_bit_width = 9,
    parameter NUM_VECTORS = 2
)();

    logic signed [input_bit_width-1:0] input_vector [0: COLS-1];
    logic signed [output_bit_width-1:0] output_vector [0: ROWS-1];

    DNN_Layer test1(
        .input_vector(input_vector),
        .output_vector(output_vector)
    );

    initial begin
        integer input_file, output_file;
        integer i, j, status;
        reg [input_bit_width-1:0] temp_input;
        reg [output_bit_width-1:0] temp_output;

        // Open the input data file
        input_file = $fopen("input_data.txt", "r");
        if (input_file == 0) begin
            $display("Error: could not open input_data.txt");
            $finish;
        end

        // Open the output data file
        output_file = $fopen("output.txt", "w");
        if (output_file == 0) begin
            $display("Error: could not open output.txt");
            $finish;
        end

        // Read NUM_VECTORS input vectors, process them, and write the outputs
        for (i = 0; i < NUM_VECTORS; i = i + 1) begin
            // Read values from the input file and assign them to input_vector
            for (j = 0; j < COLS; j = j + 1) begin
                status = $fscanf(input_file, "%b\n", temp_input);
                if (status != 1) begin
                    $display("Error: failed to read data for input_vector[%0d] of vector %0d", j, i);
                    $finish;
                end
                input_vector[j] = temp_input;
            end

            // Process the input_vector (assuming the DNN_Layer processes it)
            // Wait for some time to simulate processing if needed
            #10; // Adjust delay as needed for processing

            // Write the output_vector to the output file
            for (j = 0; j < ROWS; j = j + 1) begin
                temp_output = output_vector[j];
                $fwrite(output_file, "%b\n", temp_output);
            end
        end

        // Close the files
        $fclose(input_file);
        $fclose(output_file);

    end
endmodule
