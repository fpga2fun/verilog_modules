
module inst_fetch_tb;

  reg     CLOCK_50;
  reg     rst;
  wire[31:0]    inst;
  
       
  initial begin
    CLOCK_50 = 1'b0;
    forever #10 CLOCK_50 = ~CLOCK_50;
  end
      
  initial begin
    rst = 1'b1;
    #195 rst= 1'b0;
    #1000 $stop(2);
  end
  initial begin $readmemh ( "rom.data", inst_fetch0.rom0.rom ) end  
  inst_fetch inst_fetch0(
		.clk(CLOCK_50),
		.rst(rst),
		.inst_o(inst)	
	);
  
endmodule