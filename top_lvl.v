module top_lvl(wrclk,rdclk,rst,data_in,data_out,wrreq,rdreq);
input wrclk,rdclk,rst,wrreq,rdreq;
input[7:0]data_in;
output [7:0]data_out;
parameter Addr=3;
wire [Addr:0]wrptr,rdptr,rdsynchptr,wrsynchptr,rdaddr,wraddr;
wire full_reg,empty_reg;

checking_empty e1(rst,rdclk,wrsynchptr,rdptr,rdaddr,empty_reg,rdreq);
checking_full f1(wrptr,wraddr,full_reg,rdsynchptr,rst,wrclk,wrreq);
 fifo_mem memory(wrclk,wraddr,rdaddr,data_out,wrreq,data_in,full_reg);
 synchronizer r2w(wrclk,rst,rdptr,rdsynchptr);
 synchronizer w2r(rdclk,rst,wrptr,wrsynchptr);
endmodule
