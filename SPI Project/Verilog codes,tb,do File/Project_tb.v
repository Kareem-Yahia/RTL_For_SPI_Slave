module project_tb();

reg  MOSI;
reg SS_n,clk,rst_n;
wire MISO;
integer i;

spi_wrapper F(MOSI,MISO,SS_n,clk,rst_n);

initial begin
	clk=0;
	forever
	#1  clk=~clk;
end

initial begin
	$readmemh("mem.dat",F.r1.mem);
	SS_n=1;
	rst_n=0;
	#2 rst_n=1;
	for(i=0;i<5;i=i+1) begin
	  #2;
	  SS_n=0; //test write
	  #2 MOSI=0;
	  #2 MOSI=0;
	  #2 MOSI=0;
	  repeat (8)
	  #2 MOSI=$random;
	  #2 SS_n=1;
	  #2 SS_n=0; //test write
	  #2 MOSI=0;
	  #2 MOSI=0;
	  #2 MOSI=1;
	  repeat (8)
	  #2 MOSI=$random;
	  #2 SS_n=1;
	
	  #2 SS_n=0; //test read 
	  #2 MOSI=1;
	  #2 MOSI=1;
	  #2 MOSI=0;
	  repeat (8)
	  #2 MOSI=$random;
	  #2 SS_n=1;
	  #2 SS_n=0;
	  #2 MOSI=1;
	  #2 MOSI=1;
	  #2 MOSI=1;
	  repeat (8)
	  #2 MOSI=$random;
	  repeat (8)
	  #2 MOSI=$random;  //MOSI Here is dummy we just want to wait 8 cycles
	  #2 SS_n=1;
	end

#2 $stop;
end

endmodule