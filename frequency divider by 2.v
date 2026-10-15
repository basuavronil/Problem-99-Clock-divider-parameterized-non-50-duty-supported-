module clock_divider_by_2 (
    input  wire clk_in,   // Input clock (e.g., 100 MHz)
    input  wire rst_n,    // Asynchronous active-low reset
    output reg  clk_out   // Divided output clock (e.g., 50 MHz)
);

    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            clk_out <= 1'b0;
        end else begin
            clk_out <= ~clk_out; // Toggle on every clock edge
        end
    end

endmodule
