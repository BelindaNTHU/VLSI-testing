module ADDER #
(
    parameter ADD_BIT = 16
)
(
    input  clk,
    input  reset,
    input  enable,
    input  [ADD_BIT-1:0]  A,
    input  [ADD_BIT-1:0]  B,
    output reg out_valid,
    output reg [ADD_BIT:0]  Dout            // MSB: carry out
);

reg out_valid_n;

reg enable_ff;
reg [ADD_BIT-1:0] A_ff, B_ff;
reg [ADD_BIT:0] D_out_n;

always @(posedge clk) begin
    if (reset) begin
        enable_ff <= 0;
        out_valid <= 0;
    end else begin
        enable_ff <= enable;
        out_valid <= out_valid_n;
    end
end

always @(posedge clk) begin
    A_ff <= A;
    B_ff <= B;
    Dout <= D_out_n;
end

always @(*) begin
    D_out_n = A_ff + B_ff;
    out_valid_n = (enable_ff)? 1: out_valid;
end

endmodule
