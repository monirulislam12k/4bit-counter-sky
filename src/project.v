module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path
    input  wire       ena,      // always 1 when powered
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low active
);

    // ইন্টারনাল সিগন্যাল
    reg [3:0] count;

    // আউটপুট অ্যাসাইনমেন্ট
    assign uo_out  = {4'b0000, count}; 
    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

    // কাউন্টার লজিক (ক্লক এবং অ্যাক্টিভ-লো রিস্টেট সরাসরি ব্যবহার করা হলো)
    always @(posedge clk) begin
        if (!rst_n) begin
            count <= 4'b0000;
        end else if (ui_in[0]) begin // ui_in-এর ১ম পিনটি (Bit 0) আমাদের Enable সংকেত
            count <= count - 4'b0001; 
        end
    end

endmodule
