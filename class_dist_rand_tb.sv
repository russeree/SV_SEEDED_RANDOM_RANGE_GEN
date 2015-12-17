/**
 * Creator: Reese Russell
 * Desciption: Test and Verify usage of Classes, Rand, Constraint, and Dist
 * Language: SYSTEM VERILOG 3.1 XILINX SUPPORTED FEATURE SET
 */
`timescale 1ns/1ps

/* Define the range for your random number */ 
`define _low  100
`define _high 1000
`define _seed 42
// Random from range 
class random_range_seed;
    typedef struct packed{
        int low,high;
    } low_high;
    low_high range = {0,10};
    function int rand_range_gen;
        int out;
        out = range.low + {$random(`_seed)} % (range.high - range.low);
        return out; 
    endfunction
endclass  

/**
 * I would use program but xilinx does not support 
 * direct simulation so I went with a module instead 
 */
module dist_rand_range_test;
    /* Create Class */ 
    random_range_seed rand_range;
    /* Local Varibles */
    int output_val;
    int low;
    int high;
    /* Generate a random number */ 
    initial begin
        rand_range=new();        
        rand_range.range = {`_low,`_high};
        output_val = rand_range.rand_range_gen; 
        $display("%d \n", output_val);
    end
endmodule
