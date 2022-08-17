module FIFO #(  parameter data_width=8 ,parameter ptr_width=8)
(
	input 					clk,
    input 					reset,
    input 					WREN,
	input 					RDEN,
    input        [data_width-1:0] data_in,
    output reg   [data_width-1:0] data_out,
    output 					empty,
    output 					full );
	
	
	
	reg [data_width-1:0] data_in1;
	wire [data_width-1:0] data_out1;
	
	reg [ptr_width-1:0] read_ptr;
	reg [ptr_width-1:0] write_ptr;
	reg [8:0] count;
	
	assign empty=(count==0);
	assign full=(count==256);
	
	/////////// Reading Operation //////////////////
	
	always@(posedge clk or negedge reset)
	begin
	   if(!reset)
		begin
			read_ptr<=0;
			write_ptr<=0;
			count<=0;
		end
		
		else 
		begin
			write_ptr<= ((WREN && !full )||(WREN&&RDEN)) ? write_ptr+1 : write_ptr;
			read_ptr<= ((RDEN && !empty )||(WREN&&RDEN)) ? read_ptr+1 : read_ptr;
			
			if(WREN && RDEN)
				count<=count;
			else if(RDEN && !WREN)
				count <= (count==0)? 0 : count-1;
			else if (!RDEN && WREN)
				count <= (count==256)? 256 : count+1;
			else
				count<=count;
		end
		
		if(RDEN && !empty)
			data_out<=data_out1;
		else if (WREN&& RDEN)
			data_out<=data_out1;
			
			
	    if(WREN && !full)
			data_in1<=data_in;
		else if (WREN&& RDEN)
			data_in1<= data_in;
		else 
			data_in1<=data_in1;
		
		
		
		
		
		
		
		
		
	end
	
	
	
	memory mem  (.read_enable(RDEN),
				 .read_address(read_ptr),
				 .write_enable(WREN),
				 .write_address(write_ptr),
				 .write_data(data_in1),
				 .clk(clk),
				 .read_data(data_out1)
				);
endmodule