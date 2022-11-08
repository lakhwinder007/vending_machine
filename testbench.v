`include "vending_machine.v"
module vending_machine_tb;

reg clk;
reg [1:0]in;
reg rst;

//output
wire out;
wire [1:0]change;

vending_machine uut(.clk(clk),.rst(rst),.in(in),.out(out),.change(change));

initial begin
    $dumpfile("vending_machine.vcd");
    $dumpvars(0,vending_machine_tb);

    rst=1;
    clk=0;
   /// 5 5 5
    // #6 rst=0;
    // in=1;
    // #11 in=1;
    // #16 in=1;
    // #25 $finish;

    // 5 ,10 
// #6 rst=0;
//     in=1;
//     #11 in=2;
    
//     #25 $finish;


// 10, 10
    #6 rst=0;
    in=2;
    #11 in=2;
    #20 $finish;

   // 5 ,0
    // #6 rst=0;
    // in=1;
    // #11 in=0;
    
    // #20 $finish;
end
always #5 clk=~clk;

endmodule