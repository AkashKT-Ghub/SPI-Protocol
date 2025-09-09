`include "spi_master_design.sv"
`include "spi_slave_design.sv"

module spi_design(input clk,rst,newd,input[11:0]din,output[11:0]dout,done);
  wire sclk,mosi,cs;
  spi_master m1(clk,rst,newd,din,sclk,cs,mosi);
  spi_slave s1(sclk,cs,mosi,dout,done);
endmodule
