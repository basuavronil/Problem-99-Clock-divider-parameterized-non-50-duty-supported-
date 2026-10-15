module clock_divider (
    input  wire clk_in,   // 100 MHz input clock
    input  wire rst_n,    // Asynchronous active-low reset
    output reg  clk_out   // 10 MHz output clock
);

    // Counter variable: to count up to 5, we need 3 bits (values 0 to 4)
    reg [2:0] counter;

    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 3'd0;
            clk_out <= 1'b0;
        end else if (counter == 3'd4) begin
            counter <= 3'd0;
            clk_out <= ~clk_out; // Toggle the clock every 5 cycles
        end else begin
            counter <= counter + 3'd1;
        end
    end

endmodule
