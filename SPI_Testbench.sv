//SPI TESTBENCH
module spi_tb;
  reg clk=0, rst=0, newd=0;
  reg[11:0]din=0;
  wire done;
  wire[11:0]dout;
  always #10 clk=~clk;
  spi_design dut(.clk(clk),.rst(rst),.newd(newd),.din(din),.dout(dout),.done(done));
  initial begin
    rst=1;
    repeat (5) @(posedge clk);
    rst=0;

    repeat (5) begin
      newd=1;
      din=$urandom;
      @(posedge dut.s1.sclk);
      newd=0;
      @(posedge done);
      $display("Time=%0t  Din=%0d   Dout=%0d",$time,din,dout);
    end
    $finish();
  end
endmodule
