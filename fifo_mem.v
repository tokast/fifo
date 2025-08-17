module fifo_mem(wr_clk,wrptr,rdptr,data_out,wren,data_in,full);

parameter Addr=3;
input wr_clk,wren;
output[7:0] data_out;
input[7:0]data_in;
input[Addr:0]wrptr,rdptr;
reg[7:0]fifo_memory[0:2**Addr-1];
input full;
 
assign data_out=fifo_memory[rdptr[Addr-1:0]];
always@(posedge wr_clk)begin
	if(wren&&~full)
		fifo_memory[wrptr[Addr-1:0]]<=data_in;

end
endmodule
