module vending_machine(
    input clk,input rst,input [1:0]in,
    output reg out,output reg [1:0]change
);

parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;

reg[1:0] c_state,n_state; //current and next state

always@(posedge clk)
 begin
    if(rst==1)
    begin
        c_state=0;
        n_state=0;
        change=2'b00;
    end
    else
    c_state=n_state;

    case(c_state)
    s0:
    if(in==0)
    begin
        n_state=s0;
        out=0;
        change=2'b00;
    end
    else if(in==2'b01)
    begin
        n_state=s1;
        out=0;
        change=2'b00;
    end
    else if(in==2'b10)
    begin
        n_state=s2;
        out=0;
        change=2'b00;
    end
    s1:   // state 1 ,5Rs
    if(in==0)
    begin
        n_state=s0;                  // update n_state= s1
        out=0;
        change=2'b01;              //  update: change  this to { change = 2'b00 } as machine will come to ideal state only when timeout is over. 
    end
    else if(in==2'b01)
    begin
        n_state=s2;
        out=0;
        change=2'b00;
    end
    else if(in==2'b10)
    begin
        n_state=s0;
        out=1;
        change=2'b00;
    end
    s2:
    if(in==0)
    begin
        n_state=s0;      //   update n_state= s2
        out=0;
        change=2'b10;       //  update: change  this to { change = 2'b00 } as machine will come to ideal state only when timeout is over.
    end
    else if(in==2'b01)
    begin
        n_state=s0;
        out=1;
        change=2'b00;
    end
    else if(in==2'b10)
    begin
        n_state=s0;
        out=1;
        change=2'b01;
    end
    endcase
 end


endmodule

// in == 2'b11 is not allowed as machine will discard the simultaneous insertion of two or more coins.
