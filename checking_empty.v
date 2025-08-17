module checking_empty(rst,rdclk,wrptr,rdptr,rdaddr,empty_reg,rdreq);
parameter Addr=3;
	output reg[Addr:0]rdptr,rdaddr;
	input[Addr:0]wrptr;
	input rst,rdclk,rdreq;
	output reg empty_reg;
	wire empty;
	wire [Addr:0] rdnext;
	wire [Addr:0]rdnext_grey;
	assign empty=(rdnext_grey==wrptr);
	assign rdnext=~empty_reg&&rdreq?rdaddr+1'd1:rdaddr;
	assign rdnext_grey=(rdnext>>1)^rdnext;
	always@(posedge rdclk)begin
		if(rst)
			{rdptr,rdaddr}<=0;
		else
			{rdptr,rdaddr}<={rdnext_grey,rdnext};
			
	end
	always@(posedge rdclk)begin
		if(rst)
			empty_reg<=1;
		else 
			empty_reg<=empty;
	end
endmodule
