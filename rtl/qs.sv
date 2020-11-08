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

`include "qs_pkg.vh"
`include "qs_insts_pkg.vh"
`include "libv_pkg.vh"

module qs (

   //======================================================================== //
   //                                                                         //
   // Unsorted                                                                //
   //                                                                         //
   //======================================================================== //

   //
     input                                        in_vld
   , input                                        in_sop
   , input                                        in_eop
   , input [qs_pkg::W - 1:0]                      in_dat
   //
   , output logic                                 in_rdy

   //======================================================================== //
   //                                                                         //
   // Sorted                                                                  //
   //                                                                         //
   //======================================================================== //

   //
   , output logic                                 out_vld_r
   , output logic                                 out_sop_r
   , output logic                                 out_eop_r
   , output logic                                 out_err_r
   , output logic [qs_pkg::W - 1:0]               out_dat_r

   //======================================================================== //
   //                                                                         //
   // Misc.                                                                   //
   //                                                                         //
   //======================================================================== //

   , input                                        clk
   , input                                        rst
);

  // ======================================================================== //
  //                                                                          //
  // Instances                                                                //
  //                                                                          //
  // ======================================================================== //
  
  // ------------------------------------------------------------------------ //
  //
  qs_enq u_qs_enq (
    //
      .in_vld            (in_vld                  )
    , .in_sop            (in_sop                  )
    , .in_eop            (in_eop                  )
    , .in_dat            (in_dat                  )
    , .in_rdy            (in_rdy                  )
    //
    , .bnk_in            ()
    //
    , .bnk_out_vld_r     ()
    , .bnk_out_r         ()
    , .bnk_idx_r         ()
    //
    , .enq_wr_en_r       ()
    , .enq_wr_addr_r     ()
    , .enq_wr_data_r     ()
    //
    , .clk               (clk                     )
    , .rst               (rst                     )
  );
  
  // ------------------------------------------------------------------------ //
  //
  qs_srt u_qs_srt (
    //
      .bnk_in            ()
    , .bnk_out_vld_r     ()
    , .bnk_out_r         ()
    , .bnk_idx_r         ()
    //
    , .srt_rd_data_r     ()
    , .srt_rd_en_r       ()
    , .srt_rd_addr_r     ()
    //
    , .srt_wr_en_r       ()
    , .srt_wr_addr_r     ()
    , .srt_wr_data_r     ()
    //
    , .clk               (clk                     )
    , .rst               (rst                     )
  );
  
  // ------------------------------------------------------------------------ //
  //
  qs_deq u_qs_deq (
    //
      .out_vld_r         (out_vld_r               )
    , .out_sop_r         (out_sop_r               )
    , .out_eop_r         (out_eop_r               )
    , .out_err_r         (out_err_r               )
    , .out_dat_r         (out_dat_r               )
    //
    , .bnk_in            ()
    , .bnk_out_vld_r     ()
    , .bnk_out_r         ()
    , .bnk_idx_r         ()
    //
    , .deq_rd_data_r     ()
    , .deq_rd_en_r       ()
    , .deq_rd_addr_r     ()
    //
    , .clk               (clk                     )
    , .rst               (rst                     )
  );

  // ------------------------------------------------------------------------ //
  //
  qs_banks u_qs_banks (
    //
      .enq_bnk_in_vld_r  ()
    , .enq_bnk_in_r      ()
    , .enq_bnk_idx_r     ()
    , .enq_bnk_out_r     ()
    //
    , .enq_wr_en_r       ()
    , .enq_wr_addr_r     ()
    , .enq_wr_data_r     ()
    //
    , .srt_bnk_in_vld_r  ()
    , .srt_bnk_in_r      ()
    , .srt_bnk_idx_r     ()
    , .srt_bnk_out_r     ()
    //
    , .srt_wr_en_r       ()
    , .srt_wr_addr_r     ()
    , .srt_wr_data_r     ()
    //
    , .srt_rd_en_r       ()
    , .srt_rd_addr_r     ()
    , .srt_rd_data_r     ()
    //
    , .deq_bnk_in_vld_r  ()
    , .deq_bnk_in_r      ()
    , .deq_bnk_idx_r     ()
    , .deq_bnk_out_r     ()
    //
    , .deq_rd_en_r       ()
    , .deq_rd_addr_r     ()
    , .deq_rd_data_r     ()
    //
    , .clk               (clk                     )
    , .rst               (rst                     )
  );

endmodule // qs
