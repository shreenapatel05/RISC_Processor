`include "Processor.v"

module tb_RISCprocessor;

    reg clk = 0;
    reg Reset = 1;

    reg [7:0] InpExtWorld1 = 8'd0;
    reg [7:0] InpExtWorld2 = 8'd0;
    reg [7:0] InpExtWorld3 = 8'd0;
    reg [7:0] InpExtWorld4 = 8'd0;

    wire [7:0] OutExtWorld1, OutExtWorld2, OutExtWorld3, OutExtWorld4;

    RISCprocessor uut (
        .clk(clk),
        .Reset(Reset),
        .InpExtWorld1(InpExtWorld1),
        .InpExtWorld2(InpExtWorld2),
        .InpExtWorld3(InpExtWorld3),
        .InpExtWorld4(InpExtWorld4),
        .OutExtWorld1(OutExtWorld1),
        .OutExtWorld2(OutExtWorld2),
        .OutExtWorld3(OutExtWorld3),
        .OutExtWorld4(OutExtWorld4)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_RISCprocessor);

        #10 Reset = 0;

        #500;
        $finish;
    end
  

endmodule