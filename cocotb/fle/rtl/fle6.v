// Automatically generated by PRGA's RTL generator
module fle6 (
    // user accessible ports
    input wire [0:0] clk,
    input wire [5:0] bits_in,
    output reg [1:0] out,
    input wire [0:0] cin,
    output reg [0:0] cout,

    // configuartion ports
    input wire [0:0] cfg_clk,
    input wire [0:0] cfg_e,
    input wire [0:0] cfg_we,
    input wire [0:0] cfg_i,
    output wire [0:0] cfg_o,

    // Variables for testbench files
    input wire test_clk
    );

    // 3 modes:
    //  1. LUT6 + optional DFF
    //  2. 2x (LUT5 + optional DFF)
    //  3. 2x LUT => adder => optional DFF for sum & cout_fabric

    localparam LUT5A_DATA_WIDTH = 32;
    localparam LUT5B_DATA_WIDTH = 32;
    localparam MODE_WIDTH = 2;

    localparam MODE_LUT6X1 = 2'd0;
    localparam MODE_LUT5X2 = 2'd1;
    localparam MODE_ARITH = 2'd3;

    localparam LUT5A_DATA = 0;
    localparam LUT5B_DATA = LUT5A_DATA + LUT5A_DATA_WIDTH;
    localparam ENABLE_FFA = LUT5B_DATA + LUT5B_DATA_WIDTH;
    localparam ENABLE_FFB = ENABLE_FFA + 1;
    localparam MODE = ENABLE_FFB + 1;
    localparam CIN_FABRIC = MODE + MODE_WIDTH;
    localparam CFG_BITCOUNT = CIN_FABRIC + 1;

    reg [CFG_BITCOUNT - 1:0] cfg_d;
    reg [5:0] internal_in;
    reg [1:0] internal_lut;
    reg [1:0] internal_ff;



    // synopsys translate_off
    // in case the sensitivity list is never triggered
    initial begin
        internal_in = 6'b0;
        $dumpfile("dump.vcd");
        $dumpvars(1,fle6);
    end
    // synopsys translate_on

    always @* begin
        internal_in = bits_in;

        // synopsys translate_off
        // in simulation, force unconnected LUT input to be zeros
        if (bits_in[0] === 1'bx) begin
            internal_in[0] = 1'b0;
        end
        if (bits_in[1] === 1'bx) begin
            internal_in[1] = 1'b0;
        end
        if (bits_in[2] === 1'bx) begin
            internal_in[2] = 1'b0;
        end
        if (bits_in[3] === 1'bx) begin
            internal_in[3] = 1'b0;
        end
        if (bits_in[4] === 1'bx) begin
            internal_in[4] = 1'b0;
        end
        if (bits_in[5] === 1'bx) begin
            internal_in[5] = 1'b0;
        end
        // synopsys translate_on
    end

    wire [1:0] internal_sum;
    assign internal_sum = internal_lut[0] + internal_lut[1] + (cfg_d[CIN_FABRIC] ? internal_in[5] : cin);

    wire [MODE_WIDTH-1:0] mode;
    assign mode = cfg_d[MODE +: MODE_WIDTH];

    always @(posedge clk) begin
        if (cfg_e) begin
            internal_ff <= 2'b0;
        end else if (mode == MODE_ARITH) begin
            internal_ff <= internal_sum;
        end else if (mode == MODE_LUT6X1) begin
            internal_ff[0] <= internal_in[5] ? internal_lut[1] : internal_lut[0];
            internal_ff[1] <= 1'b0;
        end else begin
            internal_ff <= internal_lut;
        end
    end

    always @* begin
        if (cfg_e) begin    // avoid pre-programming oscillating
            internal_lut = 2'b0;
        end else begin
            case (internal_in[4:0])     // synopsys infer_mux
                5'd0: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 0];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 0];
                end
                5'd1: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 1];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 1];
                end
                5'd2: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 2];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 2];
                end
                5'd3: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 3];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 3];
                end
                5'd4: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 4];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 4];
                end
                5'd5: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 5];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 5];
                end
                5'd6: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 6];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 6];
                end
                5'd7: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 7];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 7];
                end
                5'd8: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 8];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 8];
                end
                5'd9: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 9];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 9];
                end
                5'd10: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 10];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 10];
                end
                5'd11: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 11];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 11];
                end
                5'd12: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 12];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 12];
                end
                5'd13: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 13];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 13];
                end
                5'd14: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 14];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 14];
                end
                5'd15: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 15];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 15];
                end
                5'd16: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 16];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 16];
                end
                5'd17: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 17];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 17];
                end
                5'd18: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 18];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 18];
                end
                5'd19: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 19];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 19];
                end
                5'd20: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 20];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 20];
                end
                5'd21: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 21];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 21];
                end
                5'd22: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 22];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 22];
                end
                5'd23: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 23];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 23];
                end
                5'd24: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 24];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 24];
                end
                5'd25: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 25];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 25];
                end
                5'd26: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 26];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 26];
                end
                5'd27: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 27];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 27];
                end
                5'd28: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 28];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 28];
                end
                5'd29: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 29];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 29];
                end
                5'd30: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 30];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 30];
                end
                5'd31: begin
                    internal_lut[0] = cfg_d[LUT5A_DATA + 31];
                    internal_lut[1] = cfg_d[LUT5B_DATA + 31];
                end
            endcase
        end
    end

    always @* begin
        if (cfg_e) begin    // avoid pre-programming oscillating
            out = 2'b0;
            cout = 1'b0;
        end else begin
            out = 2'b0;
            cout = 1'b0;

            case (mode)
                MODE_LUT6X1: begin
                    if (cfg_d[ENABLE_FFA]) begin
                        out[0] = internal_ff[0];
                    end else begin
                        out[0] = internal_in[5] ? internal_lut[1] : internal_lut[0];
                    end
                end
                MODE_LUT5X2: begin
                    if (cfg_d[ENABLE_FFA]) begin
                        out[0] = internal_ff[0];
                    end else begin
                        out[0] = internal_lut[0];
                    end
                    if (cfg_d[ENABLE_FFB]) begin
                        out[1] = internal_ff[1];
                    end else begin
                        out[1] = internal_lut[1];
                    end
                end
                MODE_ARITH: begin
                    if (cfg_d[ENABLE_FFA]) begin
                        out[0] = internal_ff[0];
                    end else begin
                        out[0] = internal_sum[0];
                    end
                    if (cfg_d[ENABLE_FFB]) begin
                        out[1] = internal_ff[1];
                    end else begin
                        out[1] = internal_sum[1];
                    end

                    cout = internal_sum[1];
                end
            endcase
        end
    end

    wire [CFG_BITCOUNT - 1 + 1:0] cfg_d_next;

    always @(posedge cfg_clk) begin
        if (cfg_e && cfg_we) begin
            cfg_d <= cfg_d_next;
        end
    end

    assign cfg_d_next = {cfg_d, cfg_i};
    assign cfg_o = cfg_d_next[CFG_BITCOUNT +: 1];

endmodule