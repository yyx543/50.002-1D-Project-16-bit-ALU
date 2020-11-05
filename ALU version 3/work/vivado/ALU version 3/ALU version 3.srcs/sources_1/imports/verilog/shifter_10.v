/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_10 (
    input [5:0] alufn,
    input [15:0] a,
    input [3:0] b,
    output reg [15:0] shift
  );
  
  
  
  wire [16-1:0] M_shiftleft_left;
  reg [16-1:0] M_shiftleft_a;
  reg [4-1:0] M_shiftleft_b;
  shift_left_13 shiftleft (
    .a(M_shiftleft_a),
    .b(M_shiftleft_b),
    .left(M_shiftleft_left)
  );
  
  wire [16-1:0] M_shiftright_right;
  reg [16-1:0] M_shiftright_a;
  reg [4-1:0] M_shiftright_b;
  reg [1-1:0] M_shiftright_alufn1;
  shift_right_14 shiftright (
    .a(M_shiftright_a),
    .b(M_shiftright_b),
    .alufn1(M_shiftright_alufn1),
    .right(M_shiftright_right)
  );
  
  always @* begin
    M_shiftleft_a = a;
    M_shiftleft_b = b;
    M_shiftright_a = a;
    M_shiftright_b = b;
    M_shiftright_alufn1 = alufn[1+0-:1];
    
    case (alufn[0+0-:1])
      1'h0: begin
        shift = M_shiftleft_left;
      end
      1'h1: begin
        shift = M_shiftright_right;
      end
      default: begin
        shift = M_shiftleft_left;
      end
    endcase
  end
endmodule
