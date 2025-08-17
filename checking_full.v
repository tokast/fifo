//Why is full registered

module checking_full(wrptr,wraddr,full_reg,rdptr,rst,wrclk,wrreq);
	parameter Addr=3;
	output reg[Addr:0]wrptr,wraddr;
	input[Addr:0]rdptr;
	input rst,wrclk,wrreq;
	output reg full_reg;
	wire full;
	wire [Addr:0] wrnext;
	wire [Addr:0]wrnext_grey;
	assign full=({~wrnext_grey[Addr:Addr-1],wrnext_grey[Addr-2:0]}==rdptr);
	assign wrnext=~full_reg&&wrreq?wraddr+1'd1:wraddr;
	assign wrnext_grey=(wrnext>>1)^wrnext;
	always@(posedge wrclk)begin
		if(rst)
			{wrptr,wraddr}<=0;
		else
			{wrptr,wraddr}<={wrnext_grey,wrnext};
			
	end
	always@(posedge wrclk)begin
		if(rst)
			full_reg<=0;
		else 
			full_reg<=full;
	end
endmodule
