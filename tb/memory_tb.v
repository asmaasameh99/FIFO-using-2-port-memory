`timescale 1ns / 1ps
// Testbench
module memory_tb();

	reg 					read_enable;
    reg [7:0] read_address;
    reg 					write_enable;
    reg [7:0] write_address;
    reg [7:0]  write_data;
    reg 					clk;
	wire [7:0]  read_data;
  
 memory uut (.read_enable(read_enable),
			 .read_address(read_address),
			 .write_enable(write_enable),
			 .write_address(write_address),
			 .write_data(write_data),
			 .clk(clk),
			 .read_data(read_data)
			);
			
			
always #5 clk=~clk;
			

initial begin
$dumpfile("Memory.vcd");
$dumpvars;
	
clk=0;
#30
read_enable=0;
write_enable=0;
write_address=0;
read_address=0;
write_data=0;

#10

read_enable=0;
write_enable=1;
write_address=8'h1B;
read_address=0;
write_data=8'h3B;

#10

read_enable=0;
write_enable=1;
write_address=8'h1C;
read_address=0;
write_data=8'h3D;

#10
read_enable=1;
write_enable=0;
write_address=0;
read_address=8'h1B;
write_data=0;



#20
$finish;

end		
  

endmodule










/* 
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1, memory_tb);
    
    clk = 0;
    read_enable = 0;
    write_enable = 0;
    read_address =0;
    write_address = 0;
    
    #100;
    
    toggle_clk;
    read_enable = 0;
    write_enable = 1;
    read_address =0;
    write_address = 8'h1B;
    toggle_clk;
    
   
    
    #100
    

    $display("Read initial data.");
    toggle_clk;
    $display("data[%0h]: %0h",
      read_address, read_data);
    
    $display("Write new data.");
    write_enable = 1;
	read_enable =0;
    write_data = 8'hC5;
    toggle_clk;
    write_enable = 0;
    
    $display("Read new data.");
    toggle_clk;
    $display("data[%0h]: %0h",
      read_address, read_data);
  end
  
  task toggle_clk;
    begin
      #10 clk = ~clk;
      #10 clk = ~clk;
    end
  endtask */
