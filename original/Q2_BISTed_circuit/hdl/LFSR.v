module LFSR #
(
    parameter SR_LEN = 7
)
(
    input  clk,
    input  reset,
    input  enable,
    output reg out_valid,
    output reg [SR_LEN-1:0]  Dout            // LFSR output
);

reg out_valid_n;

reg enable_ff;
reg [SR_LEN-1:0] Dout_n;

always @(posedge clk) begin
    if (reset) begin
        enable_ff <= 0;
        out_valid <= 0;

        Dout <= 7'b1000000;
    end else begin
        enable_ff <= enable;
        out_valid <= out_valid_n;

        Dout <= Dout_n;
    end
end

// always @(posedge clk) begin
//     enable_ff <= enable;
// end

integer idx;
always @(*) begin
    out_valid_n = (enable_ff)? 1: out_valid;

    // generate random patterns
    Dout_n[6] = 1;    
    Dout_n[5] = 0;
    Dout_n[4] = 0;
    Dout_n[3] = 0;
    Dout_n[2] = 0;
    Dout_n[1] = 0;
    Dout_n[0] = 0;
    if (enable_ff) begin
        Dout_n[6] = Dout[5];    
        Dout_n[5] = Dout[4];    
        Dout_n[4] = Dout[3];
        Dout_n[3] = Dout[2];
        Dout_n[2] = Dout[1];
        Dout_n[1] = Dout[0];
        Dout_n[0] = Dout[6] ^ Dout[0];
    end

end

reg [SR_LEN-1:0] cnt, cnt_n;
always @(posedge clk) begin
    if(reset) cnt <= 0;
    else cnt <= cnt_n;
end

always @(*) begin
    cnt_n = (cnt==126)? 0: cnt + 1;
end

endmodule