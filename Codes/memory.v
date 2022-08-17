module memory #(  parameter data_width=8,parameter addrs_width=8)
( 
	input 					read_enable,
    input [addrs_width-1:0] read_address,
    input 					write_enable,
    input [addrs_width-1:0] write_address,
    input [data_width-1:0]  write_data,
    input 					clk,
	output  reg [data_width-1:0]  read_data);
	
	reg [data_width-1:0] ram [2**data_width-1:0];
	
	always@(posedge clk)
	begin
		if(write_enable)
		ram [write_address] <= write_data;
		else
		ram [write_address]	<= ram [write_address];	
	end
	
	always@(posedge clk)
	begin
		if(read_enable)
		read_data <= ram [read_address];
		else
		ram [read_address]<= ram [read_address];
	end
	
	
endmodule
	
	
	