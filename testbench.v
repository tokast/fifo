module testbench;
reg wrclk,wrreq,rdclk,rst,rdreq;
wire[7:0]data_out;
reg[7:0] data_in;
top_lvl dut(wrclk,rdclk,rst,data_in,data_out,wrreq,rdreq);
always#5 wrclk<=~wrclk;
always#10 rdclk<=~rdclk;
initial begin
	wrclk<=0;
	rdclk<=0;
	wrreq<=1;
	rdreq<=1;
	rst<=1;
		@(posedge wrclk);
			@(posedge rdclk);
			rst<=0;
	data_in<=8'd1;
	@(posedge wrclk);
	data_in<=8'd2;
		@(posedge wrclk);
	data_in<=8'd3;
	@(posedge wrclk);
	data_in<=8'd4;
		@(posedge wrclk);
	data_in<=8'd5;

	@(posedge wrclk);
	data_in<=8'd6;
		@(posedge wrclk);
	data_in<=8'd7;

	@(posedge wrclk);
	data_in<=8'd8;
		@(posedge wrclk);
	data_in<=8'd9;
	@(posedge wrclk);
	data_in<=8'd10;
		@(posedge wrclk);
	data_in<=8'd11;
	@(posedge wrclk);
	data_in<=8'd2;
		@(posedge wrclk);
	data_in<=8'd3;
	@(posedge wrclk);
	data_in<=8'd4;
		@(posedge wrclk);
	data_in<=8'd5;

	@(posedge wrclk);
	data_in<=8'd6;
		@(posedge wrclk);
	data_in<=8'd7;

	@(posedge wrclk);
	data_in<=8'd8;
		@(posedge wrclk);
	data_in<=8'd9;
	@(posedge wrclk);
	data_in<=8'd10;
		@(posedge wrclk);
	data_in<=8'd11;
	@(posedge wrclk);
	data_in<=8'd2;
		@(posedge wrclk);
	data_in<=8'd3;
	@(posedge wrclk);
	data_in<=8'd4;
		@(posedge wrclk);
	data_in<=8'd5;

	@(posedge wrclk);
	data_in<=8'd6;
		@(posedge wrclk);
	data_in<=8'd7;

	@(posedge wrclk);
	data_in<=8'd8;
		@(posedge wrclk);
	data_in<=8'd9;
	@(posedge wrclk);
	data_in<=8'd10;
		@(posedge wrclk);
	data_in<=8'd11;
	wrreq<=0;
	rdreq<=0;




	
end
endmodule
