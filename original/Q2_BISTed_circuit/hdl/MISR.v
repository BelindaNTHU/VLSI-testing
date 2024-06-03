module MISR #
(
    parameter MISR_BIT = 17
)
(
    input  clk,
    input  reset,
    input  enable,
    input  [MISR_BIT-1:0]  Din,                // MISR input
    output reg out_valid,
    output reg [MISR_BIT-1:0]  Dout            // MISR output
);

// input
reg [MISR_BIT-1:0] Din_ff;
reg enable_ff;

// for MISR control
reg [7-1:0] cnt, cnt_n;
reg isFull, isFull_n;

// output
reg out_valid_n;
reg [MISR_BIT-1:0] Dout_n;

integer idx;
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
    // enable_ff <= enable;

    for (idx=0; idx<MISR_BIT; idx=idx+1) begin
        Dout[idx] <= Dout_n[idx];
    end

    for (idx=0; idx<MISR_BIT; idx=idx+1) begin
        Din_ff[idx] <= Din[idx];
    end
end

always @(*) begin
    // after all lsfr bits are shifted in and temporal compaction is done
    // out_valid_n = (isFull && cnt==126)? 1: out_valid;
    out_valid_n = (isFull)? 1: out_valid;

    // generate random patterns
    Dout_n[0] = 1;
    for (idx=1; idx<MISR_BIT; idx=idx+1) begin
        Dout_n[idx] = 0;
    end
    if (enable_ff && isFull) begin
        // parallelly feeding adder's results into MISR
        // perform temporal compression
        Dout_n[16] = Din_ff[16] ^ Dout[15];
        Dout_n[15] = Din_ff[15] ^ Dout[14];
        Dout_n[14] = Din_ff[14] ^ Dout[13];
        Dout_n[13] = Din_ff[13] ^ Dout[12];
        Dout_n[12] = Din_ff[12] ^ Dout[11];
        Dout_n[11] = Din_ff[11] ^ Dout[10];
        Dout_n[10] = Din_ff[10] ^ Dout[ 9];
        Dout_n[ 9] = Din_ff[ 9] ^ Dout[ 8];
        Dout_n[ 8] = Din_ff[ 8] ^ Dout[ 7];
        Dout_n[ 7] = Din_ff[ 7] ^ Dout[ 6];
        Dout_n[ 6] = Din_ff[ 6] ^ Dout[ 5];
        Dout_n[ 5] = Din_ff[ 5] ^ Dout[ 4];
        Dout_n[ 4] = Din_ff[ 4] ^ Dout[ 3];
        Dout_n[ 3] = Din_ff[ 3] ^ Dout[ 2];
        Dout_n[ 2] = Din_ff[ 2] ^ Dout[ 1];
        Dout_n[ 1] = Din_ff[ 1] ^ Dout[ 0];
        Dout_n[ 0] = Din_ff[ 0] ^ Dout[16] ^ Dout[2];
    end

end

always @(posedge clk) begin
    if(reset) begin
        isFull <= 0;
        cnt <= 0;
    end
    else begin
        isFull <= isFull_n;
        cnt <= cnt_n;
    end
end

always @(*) begin
    isFull_n = isFull;
    cnt_n = cnt;
    if(enable_ff) begin
        isFull_n = (cnt==32)? 1: isFull;

        if (isFull) begin
            cnt_n = (cnt==126)? 0: cnt + 1;
        end
        else begin
            cnt_n = (cnt==32)? 0: cnt + 1;
        end
    end
end

endmodule