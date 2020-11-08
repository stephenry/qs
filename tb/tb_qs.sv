//========================================================================== //
// Copyright (c) 2020, Stephen Henry
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
//
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//========================================================================== //

`include "tb_qs_pkg.vh"

module tb_qs (

  // ======================================================================== //
  // Command Interface

  // Unsorted Input:
    input                                         in_vld
  , input                                         in_sop
  , input                                         in_eop
  , input [tb_qs_pkg::OPT_W - 1:0]                in_dat

  , output                                        in_rdy_r

  // Sorted output:
  , output logic                                  out_vld_r
  , output logic                                  out_sop_r
  , output logic                                  out_eop_r
  , output logic                                  out_err_r
  , output logic [tb_qs_pkg::OPT_W - 1:0]         out_dat_r

  // ======================================================================== //
  // TB support
  , output logic [63:0]                           tb_cycle

  // ======================================================================== //
  // Clk/Reset
  , input                                         clk
  , input                                         rst
);
  
  // ------------------------------------------------------------------------ //
  //
  initial tb_cycle  = '0;

  always_ff @(posedge clk)
    tb_cycle += 'b1;

  // ------------------------------------------------------------------------ //
  //
  qs u_qs (
    //
      .in_vld                 (in_vld                  )
    , .in_sop                 (in_sop                  )
    , .in_eop                 (in_eop                  )
    , .in_dat                 (in_dat                  )
    , .in_rdy_r               (in_rdy_r                )
    //
    , .out_vld_r              (out_vld_r               )
    , .out_sop_r              (out_sop_r               )
    , .out_eop_r              (out_eop_r               )
    , .out_err_r              (out_err_r               )
    , .out_dat_r              (out_dat_r               )
    //
    , .clk                    (clk                     )
    , .rst                    (rst                     )
  );

endmodule // tb_qs
  
