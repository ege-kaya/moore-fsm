`timescale 1ns/1ns
module testbench();
wire [1:0] y;
wire [3:0] cs;
wire [3:0] ns;
reg x;
reg rst;
reg clk;
parameter inputseq1 = 32'b10101010101010101010101010101010,
	inputseq2 = 32'b00100011000110001100011000110001,
	inputseq3 = 32'b00000000000000000000000000000000,
	inputseq4 = 32'b10101000100010101000111111000001,
	inputseq5 = 32'b10001000100010101010101000101010;
integer i;

source s(y, cs, ns, x, rst, clk);

initial begin
    $dumpfile("TimingDiagram.vcd");
    $dumpvars(0, y, cs, ns, x, rst, clk);
    
    rst = 1;
    x = 0;
    #20;
    rst = 0;
    
    for (i=31; i>=0; i--) begin
        x = inputseq1[i];
        #40;
    end

    for (i=31; i>=0; i--) begin
        x = inputseq2[i];
        #40;
    end

    for (i=31; i>=0; i--) begin
        x = inputseq3[i];
        #40;
    end

    for (i=31; i>=0; i--) begin
        x = inputseq4[i];
        #40;
    end

    for (i=31; i>=0; i--) begin
        x = inputseq5[i];
        #40;
    end
    //
    
    $finish;
end

always begin	
	clk = 1;
	#20;
	clk = 0;
	#20;
    end

endmodule
