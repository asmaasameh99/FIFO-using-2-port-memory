module FIFO_tb;

	reg 					clk;
    reg 					reset;
    reg 					WREN;
	reg 					RDEN;
    reg  [7:0] data_in;
    wire [7:0] data_out;
    wire 					empty;
    wire 					full ;
	
	
	FIFO uut (.clk(clk),
			  .reset(reset),
			  .WREN(WREN),
			  .RDEN(RDEN),
			  .data_in(data_in),
			  .data_out(data_out),
			  .empty(empty),
			  .full(full)
			);
			
always #5 clk=~clk;
			

initial begin
$dumpfile("Comb.vcd");
$dumpvars;
	
clk=0;
reset=0;
WREN=0;
RDEN=0;
data_in=0;

#10

reset=1;
WREN=1;
RDEN=0;
data_in=8'h1B;

#10

reset=1;
WREN=1;
RDEN=0;
data_in=8'h3B;

#10

reset=1;
WREN=1;
RDEN=0;
data_in=8'h5B;

#10

reset=1;
WREN=0;
RDEN=1;
data_in=0;


#10

reset=1;
WREN=1;
RDEN=1;
data_in=8'h7B;


#10

reset=1;
WREN=1;
RDEN=1;
data_in=8'h7B;

#10

reset=1;
WREN=1;
RDEN=1;
data_in=8'h7B;



#20
$finish;

end			
	
endmodule