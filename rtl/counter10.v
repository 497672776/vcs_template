module counter10(
    //端口定义
    input                   rstn,   //复位端，低有效
    input                   clk,    //输入时钟
    output [3:0]    cnt,    //计数输出
    output                  cout);  //溢出位
    reg [3:0]               cnt_temp ;      //计数器寄存器

`ifdef COUNTER24
    parameter   CNT_END = 23 ;
`elsif COUNTER_FREE
    parameter   CNT_END = `CNT_FREE ;
`endif   

    always@(posedge clk or negedge rstn) begin
        if(! rstn)begin         //复位时，计时归0
            cnt_temp        <= 4'b0 ;
        end
        else if (cnt_temp==CNT_END) begin  //计时10个cycle时归0
            cnt_temp        <=4'b000;
        end
        else begin                      //计时加1
            cnt_temp        <= cnt_temp + 1'b1 ;
        end
    end

    assign  cout = (cnt_temp==CNT_END) ;       //输出周期位
    assign  cnt  = cnt_temp ;               //输出实时计时器
endmodule
