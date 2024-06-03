module TOP #
(
    parameter ADD_BIT = 16,
    parameter SR_LEN = 7
)
(
    input  clk,
    input  reset,
    input  enable,
    output out_valid,
    output [ADD_BIT:0]  Dout            // ADDER output

);

wire lfsr_out_valid;
wire [SR_LEN-1:0] lfsr_pat;

reg [ADD_BIT*2-1:0] random_gen, random_gen_ff;                  // redistributed random patterns from LFSR
wire [ADD_BIT-1:0] A = random_gen_ff[ADD_BIT-1-:ADD_BIT];
wire [ADD_BIT-1:0] B = random_gen_ff[ADD_BIT*2-1-:ADD_BIT];

wire adder_out_valid;
wire [ADD_BIT:0] adder_Dout;

wire misr_out_valid;
wire [ADD_BIT:0] misr_Dout;

// subckt
LFSR  U0_LFSR(.clk(clk), .reset(reset), .enable(enable), .out_valid(lfsr_out_valid), .Dout(lfsr_pat));
ADDER U0_ADDER(.clk(clk), .reset(reset), .enable(lfsr_out_valid), .A(A), .B(B), .out_valid(adder_out_valid), .Dout(adder_Dout));
MISR  U0_MISR(.clk(clk), .reset(reset), .enable(adder_out_valid), .Din(adder_Dout), .out_valid(misr_out_valid), .Dout(misr_Dout));

// assign outputs
assign out_valid = misr_out_valid;
assign Dout = misr_Dout;

// random pattern generation using shift register
integer idx;
always @(posedge clk) begin
    if (reset) begin
        for (idx=0; idx<ADD_BIT*2; idx=idx+1) begin
            random_gen_ff[idx] <= 0;
        end
    end else begin
        for (idx=0; idx<ADD_BIT*2; idx=idx+1) begin
            random_gen_ff[idx] <= random_gen[idx];
        end
    end
end

always @(*) begin
    random_gen[0] = lfsr_pat[0];
    for (idx=0; idx<ADD_BIT*2-1; idx=idx+1) begin
        random_gen[idx+1] = random_gen_ff[idx];
    end
end

endmodule