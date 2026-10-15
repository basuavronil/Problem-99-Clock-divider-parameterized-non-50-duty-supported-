`timescale 1ns / 1ps

module tb_clock_divider;

    // Inputs
    reg clk_in;
    reg rst_n;

    // Outputs
    wire clk_out;

    // Instantiate the Unit Under Test (UUT)
    clock_divider uut (
        .clk_in(clk_in),
        .rst_n(rst_n),
        .clk_out(clk_out)
    );

    // Generate 100 MHz input clock (Period = 10 ns -> 5 ns high, 5 ns low)
    initial begin
        clk_in = 1'b0;
        forever #5 clk_in = ~clk_in;
    end

    // Stimulus, Monitoring, and Waveform Dumping
    initial begin
        // Setup waveform dumping for tools like GTKWave
        $dumpfile("clock_divider_tb.vcd");
        $dumpvars(0, tb_clock_divider);

        // Print changes to the console
        $monitor("Time = %0t ns | rst_n = %b | clk_in = %b | clk_out = %b", 
                 $time, rst_n, clk_in, clk_out);

        // Apply initial reset
        rst_n = 1'b0;
        #25; // Hold reset for 25 ns
        
        // Release reset
        rst_n = 1'b1;

        // Run the simulation long enough to observe multiple 10 MHz cycles
        #400;
        
        // End simulation
        $finish;
    end

endmodule
