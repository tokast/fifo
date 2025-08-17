module synchronizer(clk,rst,in,out);
parameter Addr=3;
input clk,rst;
input[Addr:0] in;
output reg[Addr:0] out;
reg[Addr:0] q1;

always@(posedge clk)begin
	if(rst)begin
		{q1,out}<=2'd0;
	
	end
	else begin
		{out,q1}<={q1,in};
	
	end


end

endmodule
