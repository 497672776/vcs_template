module test;
wire [3:0]   cnt ;
wire         cout ;

// clock and reset logic
reg             rstn ;
reg             clk ;
initial begin
    rstn    = 1'b0 ;
    clk     = 1'b0 ;
    # 11 ;
    rstn    = 1'b1 ;
end
always #5 clk = ~clk ;

counter10 u_cnt(
    .rstn     (rstn),   //复位端，低有效
    .clk      (clk),    //输入时钟
    .cnt      (cnt),    //计数输出
    .cout     (cout));  //溢出位

// finish the simulation
initial begin
    forever begin
           #100;
           if ($time>=1000) $finish ;
    end
end

endmodule