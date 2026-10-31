<!---
Please fill out this form to document your project in the OpenLane ASIC flow.
--->

## How it works

A synchronous 4-bit down counter built using Verilog. On every positive edge of the clock (`clk`), if the active-low reset (`rst_n`) is stable (high) and the enable signal from `ui_in[0]` is active, the register decrements its current value by 1. The 4-bit output vector is wired directly to the low-order bits of `uo_out[3:0]`.

## How to test

1. Apply an active-low reset signal by driving `rst_n` to 0, which clears the configuration counter register back to `4'b0000`.
2. Set `rst_n` back to 1 to enable normal execution mode.
3. Assert the enable input signal by setting `ui_in[0]` to 1.
4. Toggle the global master clock input (`clk`) and visually trace the binary sequences decrementing on the output port lines `uo_out[3:0]`.
