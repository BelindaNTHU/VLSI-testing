/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Mon Dec 27 16:45:00 2021
/////////////////////////////////////////////////////////////


module LFSR ( clk, reset, enable, out_valid, Dout );
  output [6:0] Dout;
  input clk, reset, enable;
  output out_valid;
  wire   enable_ff, n3, n5, n1, n4;
  wire   [6:0] Dout_n;

  DFFTRX2 enable_ff_reg ( .D(enable), .RN(n3), .CK(clk), .Q(enable_ff), .QN(n5) );
  DFFTRX1 Dout_reg_1_ ( .D(Dout_n[1]), .RN(n3), .CK(clk), .Q(Dout[1]) );
  DFFTRX1 Dout_reg_2_ ( .D(Dout_n[2]), .RN(n3), .CK(clk), .Q(Dout[2]) );
  DFFTRX1 Dout_reg_3_ ( .D(Dout_n[3]), .RN(n3), .CK(clk), .Q(Dout[3]) );
  DFFTRX1 Dout_reg_4_ ( .D(Dout_n[4]), .RN(n3), .CK(clk), .Q(Dout[4]) );
  DFFTRX1 Dout_reg_5_ ( .D(Dout_n[5]), .RN(n3), .CK(clk), .Q(Dout[5]) );
  MDFFHQX1 Dout_reg_6_ ( .D0(Dout_n[6]), .D1(1'b1), .S0(reset), .CK(clk), .Q(
        Dout[6]) );
  DFFTRX1 Dout_reg_0_ ( .D(Dout_n[0]), .RN(n3), .CK(clk), .Q(Dout[0]), .QN(n4)
         );
  EDFFTRXL out_valid_reg ( .RN(n3), .D(1'b1), .E(enable_ff), .CK(clk), .Q(
        out_valid) );
  INVX3 U4 ( .A(reset), .Y(n3) );
  INVX1 U5 ( .A(Dout[6]), .Y(n1) );
  AND2X2 U6 ( .A(Dout[2]), .B(enable_ff), .Y(Dout_n[3]) );
  AND2X2 U7 ( .A(Dout[1]), .B(enable_ff), .Y(Dout_n[2]) );
  AND2X2 U8 ( .A(Dout[4]), .B(enable_ff), .Y(Dout_n[5]) );
  NOR2X1 U9 ( .A(n5), .B(n4), .Y(Dout_n[1]) );
  AND2X2 U10 ( .A(Dout[3]), .B(enable_ff), .Y(Dout_n[4]) );
  AOI221X1 U11 ( .A0(Dout[0]), .A1(Dout[6]), .B0(n4), .B1(n1), .C0(n5), .Y(
        Dout_n[0]) );
  NAND2BX1 U12 ( .AN(Dout[5]), .B(enable_ff), .Y(Dout_n[6]) );
endmodule


module ADDER ( clk, reset, enable, A, B, out_valid, Dout );
  input [15:0] A;
  input [15:0] B;
  output [16:0] Dout;
  input clk, reset, enable;
  output out_valid;
  wire   enable_ff, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137;
  wire   [15:0] A_ff;
  wire   [15:0] B_ff;
  wire   [16:1] D_out_n;

  DFFTRX1 enable_ff_reg ( .D(enable), .RN(n2), .CK(clk), .Q(enable_ff) );
  DFFHQX4 A_ff_reg_4_ ( .D(A[4]), .CK(clk), .Q(A_ff[4]) );
  DFFHQX4 A_ff_reg_2_ ( .D(A[2]), .CK(clk), .Q(A_ff[2]) );
  DFFHQX8 A_ff_reg_1_ ( .D(A[1]), .CK(clk), .Q(A_ff[1]) );
  DFFHQX4 B_ff_reg_11_ ( .D(B[11]), .CK(clk), .Q(B_ff[11]) );
  DFFHQX4 B_ff_reg_4_ ( .D(B[4]), .CK(clk), .Q(B_ff[4]) );
  DFFHQX4 B_ff_reg_2_ ( .D(B[2]), .CK(clk), .Q(B_ff[2]) );
  DFFHQX4 B_ff_reg_0_ ( .D(B[0]), .CK(clk), .Q(B_ff[0]) );
  DFFQX1 Dout_reg_2_ ( .D(D_out_n[2]), .CK(clk), .Q(Dout[2]) );
  DFFQX1 Dout_reg_1_ ( .D(D_out_n[1]), .CK(clk), .Q(Dout[1]) );
  DFFQX1 Dout_reg_0_ ( .D(n137), .CK(clk), .Q(Dout[0]) );
  DFFHQX4 B_ff_reg_10_ ( .D(B[10]), .CK(clk), .Q(B_ff[10]) );
  DFFHQX4 B_ff_reg_7_ ( .D(B[7]), .CK(clk), .Q(B_ff[7]) );
  DFFHQX4 A_ff_reg_7_ ( .D(A[7]), .CK(clk), .Q(A_ff[7]) );
  DFFHQX8 B_ff_reg_5_ ( .D(B[5]), .CK(clk), .Q(B_ff[5]) );
  DFFHQX8 A_ff_reg_5_ ( .D(A[5]), .CK(clk), .Q(A_ff[5]) );
  DFFHQX4 Dout_reg_6_ ( .D(D_out_n[6]), .CK(clk), .Q(Dout[6]) );
  DFFHQX8 B_ff_reg_3_ ( .D(B[3]), .CK(clk), .Q(B_ff[3]) );
  DFFHQX2 Dout_reg_8_ ( .D(D_out_n[8]), .CK(clk), .Q(Dout[8]) );
  DFFHQX8 B_ff_reg_1_ ( .D(B[1]), .CK(clk), .Q(B_ff[1]) );
  DFFQX4 Dout_reg_16_ ( .D(D_out_n[16]), .CK(clk), .Q(Dout[16]) );
  EDFFTRXL out_valid_reg ( .RN(n2), .D(1'b1), .E(enable_ff), .CK(clk), .Q(
        out_valid) );
  DFFHQX4 Dout_reg_12_ ( .D(D_out_n[12]), .CK(clk), .Q(Dout[12]) );
  DFFHQX4 Dout_reg_11_ ( .D(D_out_n[11]), .CK(clk), .Q(Dout[11]) );
  DFFHQX4 Dout_reg_15_ ( .D(D_out_n[15]), .CK(clk), .Q(Dout[15]) );
  DFFHQX4 Dout_reg_14_ ( .D(D_out_n[14]), .CK(clk), .Q(Dout[14]) );
  DFFHQX4 Dout_reg_13_ ( .D(D_out_n[13]), .CK(clk), .Q(Dout[13]) );
  DFFHQX4 Dout_reg_9_ ( .D(D_out_n[9]), .CK(clk), .Q(Dout[9]) );
  DFFHQX4 Dout_reg_10_ ( .D(D_out_n[10]), .CK(clk), .Q(Dout[10]) );
  DFFQX1 Dout_reg_4_ ( .D(D_out_n[4]), .CK(clk), .Q(Dout[4]) );
  DFFQX4 A_ff_reg_12_ ( .D(A[12]), .CK(clk), .Q(A_ff[12]) );
  DFFQX4 B_ff_reg_12_ ( .D(B[12]), .CK(clk), .Q(B_ff[12]) );
  DFFQX4 A_ff_reg_15_ ( .D(A[15]), .CK(clk), .Q(A_ff[15]) );
  DFFQX4 B_ff_reg_15_ ( .D(B[15]), .CK(clk), .Q(B_ff[15]) );
  DFFQX4 A_ff_reg_14_ ( .D(A[14]), .CK(clk), .Q(A_ff[14]) );
  DFFQX4 B_ff_reg_14_ ( .D(B[14]), .CK(clk), .Q(B_ff[14]) );
  DFFHQX4 B_ff_reg_6_ ( .D(B[6]), .CK(clk), .Q(B_ff[6]) );
  DFFHQX4 A_ff_reg_6_ ( .D(A[6]), .CK(clk), .Q(A_ff[6]) );
  DFFHQX4 B_ff_reg_9_ ( .D(B[9]), .CK(clk), .Q(B_ff[9]) );
  DFFHQX4 A_ff_reg_9_ ( .D(A[9]), .CK(clk), .Q(A_ff[9]) );
  DFFHQX4 A_ff_reg_10_ ( .D(A[10]), .CK(clk), .Q(A_ff[10]) );
  DFFHQX4 A_ff_reg_11_ ( .D(A[11]), .CK(clk), .Q(A_ff[11]) );
  DFFHQX2 Dout_reg_7_ ( .D(D_out_n[7]), .CK(clk), .Q(Dout[7]) );
  DFFHQX4 A_ff_reg_0_ ( .D(A[0]), .CK(clk), .Q(A_ff[0]) );
  DFFHQX4 A_ff_reg_3_ ( .D(A[3]), .CK(clk), .Q(A_ff[3]) );
  DFFHQX4 A_ff_reg_8_ ( .D(A[8]), .CK(clk), .Q(A_ff[8]) );
  DFFHQX4 B_ff_reg_8_ ( .D(B[8]), .CK(clk), .Q(B_ff[8]) );
  DFFQX4 A_ff_reg_13_ ( .D(A[13]), .CK(clk), .Q(A_ff[13]) );
  DFFQX4 B_ff_reg_13_ ( .D(B[13]), .CK(clk), .Q(B_ff[13]) );
  DFFQX1 Dout_reg_3_ ( .D(D_out_n[3]), .CK(clk), .Q(Dout[3]) );
  DFFHQX4 Dout_reg_5_ ( .D(D_out_n[5]), .CK(clk), .Q(Dout[5]) );
  XOR2X2 U4 ( .A(n35), .B(n34), .Y(D_out_n[7]) );
  OR2X1 U5 ( .A(A_ff[0]), .B(B_ff[0]), .Y(n108) );
  AND2X2 U6 ( .A(n127), .B(n126), .Y(n8) );
  AND2X2 U7 ( .A(n55), .B(n59), .Y(n6) );
  AND2X2 U8 ( .A(n84), .B(n95), .Y(n10) );
  AND2X2 U9 ( .A(n51), .B(n76), .Y(n11) );
  AND2X2 U10 ( .A(n121), .B(n120), .Y(n4) );
  AND2X2 U11 ( .A(n90), .B(n96), .Y(n5) );
  OR2X1 U12 ( .A(A_ff[5]), .B(B_ff[5]), .Y(n127) );
  OR2X1 U13 ( .A(A_ff[7]), .B(B_ff[7]), .Y(n33) );
  INVX1 U14 ( .A(n41), .Y(n70) );
  INVX1 U15 ( .A(n128), .Y(n131) );
  INVX1 U16 ( .A(n119), .Y(n121) );
  INVX2 U17 ( .A(n103), .Y(n45) );
  OAI21X2 U18 ( .A0(n103), .A1(n87), .B0(n86), .Y(n88) );
  INVX1 U19 ( .A(n115), .Y(n124) );
  INVX3 U20 ( .A(n93), .Y(n87) );
  INVX1 U21 ( .A(n100), .Y(n86) );
  INVX1 U22 ( .A(n57), .Y(n58) );
  NOR2X4 U23 ( .A(n75), .B(n78), .Y(n93) );
  NOR2X4 U24 ( .A(n23), .B(n22), .Y(n21) );
  NOR2X4 U25 ( .A(A_ff[8]), .B(B_ff[8]), .Y(n41) );
  NOR2X4 U26 ( .A(A_ff[12]), .B(B_ff[12]), .Y(n75) );
  NOR2X4 U27 ( .A(n132), .B(n130), .Y(n37) );
  NOR2X6 U28 ( .A(A_ff[13]), .B(B_ff[13]), .Y(n78) );
  NOR2X6 U29 ( .A(n63), .B(n60), .Y(n43) );
  NAND2X6 U30 ( .A(B_ff[2]), .B(A_ff[2]), .Y(n129) );
  NOR2X6 U31 ( .A(A_ff[3]), .B(B_ff[3]), .Y(n132) );
  BUFX8 U32 ( .A(n18), .Y(n17) );
  CLKINVX6 U33 ( .A(B_ff[1]), .Y(n27) );
  INVX6 U34 ( .A(n44), .Y(n103) );
  NAND2X2 U35 ( .A(A_ff[3]), .B(B_ff[3]), .Y(n133) );
  INVXL U36 ( .A(reset), .Y(n2) );
  NAND2X1 U37 ( .A(n70), .B(n68), .Y(n40) );
  NAND2X1 U38 ( .A(n134), .B(n133), .Y(n135) );
  INVX1 U39 ( .A(n78), .Y(n51) );
  INVX1 U40 ( .A(n68), .Y(n69) );
  INVX1 U41 ( .A(n97), .Y(n84) );
  INVX1 U42 ( .A(n75), .Y(n46) );
  INVX1 U43 ( .A(n60), .Y(n55) );
  INVX1 U44 ( .A(n130), .Y(n113) );
  NAND2X6 U45 ( .A(A_ff[8]), .B(B_ff[8]), .Y(n68) );
  XOR2X4 U46 ( .A(n3), .B(n4), .Y(D_out_n[6]) );
  AO21X2 U47 ( .A0(n125), .A1(n14), .B0(n118), .Y(n3) );
  XNOR2X4 U48 ( .A(n91), .B(n5), .Y(D_out_n[14]) );
  XNOR2X4 U49 ( .A(n56), .B(n6), .Y(D_out_n[10]) );
  NOR2X2 U50 ( .A(n94), .B(n87), .Y(n89) );
  XOR2X4 U51 ( .A(n7), .B(n8), .Y(D_out_n[5]) );
  AO21X2 U52 ( .A0(n125), .A1(n124), .B0(n123), .Y(n7) );
  OA21X4 U53 ( .A0(n71), .A1(n68), .B0(n72), .Y(n9) );
  NOR2X8 U54 ( .A(A_ff[9]), .B(B_ff[9]), .Y(n71) );
  NAND2X4 U55 ( .A(A_ff[9]), .B(B_ff[9]), .Y(n72) );
  NAND2X6 U56 ( .A(n57), .B(n43), .Y(n94) );
  NOR2X2 U57 ( .A(n94), .B(n102), .Y(n105) );
  NAND2BX1 U58 ( .AN(n71), .B(n72), .Y(n73) );
  CLKINVX1 U59 ( .A(n9), .Y(n54) );
  XNOR2X4 U60 ( .A(n85), .B(n10), .Y(D_out_n[15]) );
  XNOR2X4 U61 ( .A(n52), .B(n11), .Y(D_out_n[13]) );
  INVX3 U62 ( .A(n14), .Y(n30) );
  NAND3X2 U63 ( .A(n36), .B(n24), .C(n14), .Y(n19) );
  NOR2X8 U64 ( .A(n41), .B(n71), .Y(n57) );
  NAND4X4 U65 ( .A(n128), .B(n14), .C(n24), .D(n37), .Y(n20) );
  XNOR2X2 U66 ( .A(n106), .B(n40), .Y(D_out_n[8]) );
  AOI21X4 U67 ( .A0(n106), .A1(n105), .B0(n104), .Y(n107) );
  NOR2X6 U68 ( .A(A_ff[11]), .B(B_ff[11]), .Y(n63) );
  NAND2X1 U69 ( .A(n65), .B(n64), .Y(n66) );
  NAND2X4 U70 ( .A(A_ff[10]), .B(B_ff[10]), .Y(n59) );
  NOR2X2 U71 ( .A(n94), .B(n81), .Y(n83) );
  NOR2X8 U72 ( .A(A_ff[10]), .B(B_ff[10]), .Y(n60) );
  NAND2X1 U73 ( .A(n46), .B(n77), .Y(n47) );
  OAI21X2 U74 ( .A0(n117), .A1(n119), .B0(n120), .Y(n31) );
  CLKINVX1 U75 ( .A(n96), .Y(n79) );
  AOI21X4 U76 ( .A0(n106), .A1(n57), .B0(n54), .Y(n56) );
  AOI21X4 U77 ( .A0(n106), .A1(n70), .B0(n69), .Y(n74) );
  AOI21X4 U78 ( .A0(n106), .A1(n25), .B0(n45), .Y(n48) );
  AOI21X4 U79 ( .A0(n106), .A1(n62), .B0(n61), .Y(n67) );
  INVX3 U80 ( .A(n92), .Y(n90) );
  AOI21X2 U81 ( .A0(n32), .A1(n125), .B0(n31), .Y(n35) );
  CLKINVX1 U82 ( .A(n94), .Y(n25) );
  AOI21X4 U83 ( .A0(n106), .A1(n89), .B0(n88), .Y(n91) );
  AOI21X4 U84 ( .A0(n106), .A1(n83), .B0(n82), .Y(n85) );
  AOI21X4 U85 ( .A0(n106), .A1(n50), .B0(n49), .Y(n52) );
  OAI21X4 U86 ( .A0(n78), .A1(n77), .B0(n76), .Y(n100) );
  OAI21X4 U87 ( .A0(n71), .A1(n68), .B0(n72), .Y(n53) );
  INVX20 U88 ( .A(n15), .Y(n106) );
  NOR2X1 U89 ( .A(n94), .B(n75), .Y(n50) );
  NAND2X6 U90 ( .A(n39), .B(n24), .Y(n16) );
  NAND2X4 U91 ( .A(A_ff[6]), .B(B_ff[6]), .Y(n120) );
  OAI21X2 U92 ( .A0(n103), .A1(n102), .B0(n101), .Y(n104) );
  OAI21X2 U93 ( .A0(n103), .A1(n75), .B0(n77), .Y(n49) );
  XOR2X4 U94 ( .A(n74), .B(n73), .Y(D_out_n[9]) );
  XOR2X4 U95 ( .A(n48), .B(n47), .Y(D_out_n[12]) );
  NAND2X4 U96 ( .A(n93), .B(n90), .Y(n81) );
  OAI21X2 U97 ( .A0(n131), .A1(n130), .B0(n129), .Y(n136) );
  OAI21X1 U98 ( .A0(n9), .A1(n60), .B0(n59), .Y(n61) );
  NOR2X1 U99 ( .A(n58), .B(n60), .Y(n62) );
  AOI21X2 U100 ( .A0(n100), .A1(n90), .B0(n79), .Y(n80) );
  OA21X4 U101 ( .A0(n17), .A1(n122), .B0(n126), .Y(n117) );
  INVX3 U102 ( .A(n38), .Y(n22) );
  OAI21X2 U103 ( .A0(n103), .A1(n81), .B0(n80), .Y(n82) );
  XOR2X4 U104 ( .A(n67), .B(n66), .Y(D_out_n[11]) );
  INVXL U105 ( .A(n122), .Y(n123) );
  NOR2X2 U106 ( .A(n92), .B(n97), .Y(n99) );
  NAND2X2 U107 ( .A(A_ff[7]), .B(B_ff[7]), .Y(n38) );
  CLKINVX1 U108 ( .A(n117), .Y(n118) );
  NAND2XL U109 ( .A(n124), .B(n122), .Y(n116) );
  INVXL U110 ( .A(n132), .Y(n134) );
  INVXL U111 ( .A(n63), .Y(n65) );
  NAND2XL U112 ( .A(n109), .B(n111), .Y(n110) );
  AND2X1 U113 ( .A(n29), .B(n111), .Y(n12) );
  NOR2X6 U114 ( .A(n115), .B(n18), .Y(n14) );
  INVX8 U115 ( .A(n112), .Y(n28) );
  NOR2X8 U116 ( .A(A_ff[7]), .B(B_ff[7]), .Y(n13) );
  NOR2X4 U117 ( .A(n120), .B(n13), .Y(n23) );
  NOR2X8 U118 ( .A(n119), .B(n13), .Y(n24) );
  NOR2X8 U119 ( .A(B_ff[4]), .B(A_ff[4]), .Y(n115) );
  NOR2X8 U120 ( .A(A_ff[5]), .B(B_ff[5]), .Y(n18) );
  AND4X8 U121 ( .A(n19), .B(n20), .C(n16), .D(n21), .Y(n15) );
  NOR2X8 U122 ( .A(B_ff[6]), .B(A_ff[6]), .Y(n119) );
  NAND2X8 U123 ( .A(n28), .B(n109), .Y(n29) );
  NAND2X8 U124 ( .A(n27), .B(n26), .Y(n109) );
  INVX12 U125 ( .A(A_ff[1]), .Y(n26) );
  OAI21X4 U126 ( .A0(n132), .A1(n129), .B0(n133), .Y(n36) );
  NAND2X8 U127 ( .A(n29), .B(n111), .Y(n128) );
  NAND2X8 U128 ( .A(B_ff[1]), .B(A_ff[1]), .Y(n111) );
  NAND2X8 U129 ( .A(B_ff[0]), .B(A_ff[0]), .Y(n112) );
  NOR2X8 U130 ( .A(A_ff[2]), .B(B_ff[2]), .Y(n130) );
  NAND2X2 U131 ( .A(A_ff[14]), .B(B_ff[14]), .Y(n96) );
  AO21X4 U132 ( .A0(n128), .A1(n37), .B0(n36), .Y(n125) );
  NOR2X1 U133 ( .A(n30), .B(n119), .Y(n32) );
  NAND2X4 U134 ( .A(A_ff[4]), .B(B_ff[4]), .Y(n122) );
  NAND2X4 U135 ( .A(A_ff[5]), .B(B_ff[5]), .Y(n126) );
  NAND2X1 U136 ( .A(n33), .B(n38), .Y(n34) );
  OAI21X4 U137 ( .A0(n17), .A1(n122), .B0(n126), .Y(n39) );
  NAND2X2 U138 ( .A(A_ff[11]), .B(B_ff[11]), .Y(n64) );
  OA21X4 U139 ( .A0(n59), .A1(n63), .B0(n64), .Y(n42) );
  OAI2BB1X4 U140 ( .A0N(n53), .A1N(n43), .B0(n42), .Y(n44) );
  NAND2X4 U141 ( .A(A_ff[12]), .B(B_ff[12]), .Y(n77) );
  NAND2X2 U142 ( .A(A_ff[13]), .B(B_ff[13]), .Y(n76) );
  NOR2X4 U143 ( .A(A_ff[14]), .B(B_ff[14]), .Y(n92) );
  NOR2X4 U144 ( .A(A_ff[15]), .B(B_ff[15]), .Y(n97) );
  NAND2X2 U145 ( .A(A_ff[15]), .B(B_ff[15]), .Y(n95) );
  NAND2X2 U146 ( .A(n93), .B(n99), .Y(n102) );
  OAI21X1 U147 ( .A0(n97), .A1(n96), .B0(n95), .Y(n98) );
  AOI21X2 U148 ( .A0(n100), .A1(n99), .B0(n98), .Y(n101) );
  INVX3 U149 ( .A(n107), .Y(D_out_n[16]) );
  AND2X1 U150 ( .A(n108), .B(n112), .Y(n137) );
  XOR2X1 U151 ( .A(n110), .B(n112), .Y(D_out_n[1]) );
  NAND2XL U152 ( .A(n113), .B(n129), .Y(n114) );
  XOR2X1 U153 ( .A(n12), .B(n114), .Y(D_out_n[2]) );
  XNOR2X1 U154 ( .A(n116), .B(n125), .Y(D_out_n[4]) );
  XNOR2X1 U155 ( .A(n136), .B(n135), .Y(D_out_n[3]) );
endmodule


module MISR ( clk, reset, enable, Din, out_valid, Dout );
  input [16:0] Din;
  output [16:0] Dout;
  input clk, reset, enable;
  output out_valid;
  wire   n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, enable_ff, isFull, N49, N50, N52, N54, N55, n27,
         n32, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n28, n29, n30,
         n31, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n490, n500, n51, n520, n53, n540, n550, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n83;
  wire   [16:0] Dout_n;
  wire   [16:0] Din_ff;
  wire   [6:0] cnt;

  DFFTRX4 enable_ff_reg ( .D(enable), .RN(n83), .CK(clk), .Q(enable_ff), .QN(
        n56) );
  DFFQX1 Din_ff_reg_16_ ( .D(Din[16]), .CK(clk), .Q(Din_ff[16]) );
  DFFQX1 Din_ff_reg_15_ ( .D(Din[15]), .CK(clk), .Q(Din_ff[15]) );
  DFFQX1 Din_ff_reg_14_ ( .D(Din[14]), .CK(clk), .Q(Din_ff[14]) );
  DFFQX1 Din_ff_reg_13_ ( .D(Din[13]), .CK(clk), .Q(Din_ff[13]) );
  DFFQX1 Din_ff_reg_12_ ( .D(Din[12]), .CK(clk), .Q(Din_ff[12]) );
  DFFQX1 Din_ff_reg_11_ ( .D(Din[11]), .CK(clk), .Q(Din_ff[11]) );
  DFFQX1 Din_ff_reg_10_ ( .D(Din[10]), .CK(clk), .Q(Din_ff[10]) );
  DFFQX1 Din_ff_reg_9_ ( .D(Din[9]), .CK(clk), .Q(Din_ff[9]) );
  DFFQX1 Din_ff_reg_8_ ( .D(Din[8]), .CK(clk), .Q(Din_ff[8]) );
  DFFQX1 Din_ff_reg_7_ ( .D(Din[7]), .CK(clk), .Q(Din_ff[7]) );
  DFFQX1 Din_ff_reg_6_ ( .D(Din[6]), .CK(clk), .Q(Din_ff[6]) );
  DFFQX1 Din_ff_reg_5_ ( .D(Din[5]), .CK(clk), .Q(Din_ff[5]) );
  DFFQX1 Din_ff_reg_4_ ( .D(Din[4]), .CK(clk), .Q(Din_ff[4]) );
  DFFQX1 Din_ff_reg_3_ ( .D(Din[3]), .CK(clk), .Q(Din_ff[3]) );
  DFFQX1 Din_ff_reg_2_ ( .D(Din[2]), .CK(clk), .Q(Din_ff[2]) );
  DFFQX1 Din_ff_reg_1_ ( .D(Din[1]), .CK(clk), .Q(Din_ff[1]) );
  EDFFTRX4 cnt_reg_0_ ( .RN(n83), .D(N49), .E(enable_ff), .CK(clk), .Q(cnt[0]), 
        .QN(n60) );
  EDFFTRX4 cnt_reg_1_ ( .RN(n83), .D(N50), .E(enable_ff), .CK(clk), .Q(cnt[1]), 
        .QN(n2) );
  EDFFTRX4 cnt_reg_2_ ( .RN(n83), .D(n6), .E(enable_ff), .CK(clk), .Q(cnt[2]), 
        .QN(n58) );
  EDFFTRX4 cnt_reg_3_ ( .RN(n83), .D(N52), .E(enable_ff), .CK(clk), .Q(cnt[3]), 
        .QN(n27) );
  EDFFTRX4 cnt_reg_4_ ( .RN(n83), .D(n5), .E(enable_ff), .CK(clk), .Q(cnt[4]), 
        .QN(n63) );
  EDFFTRX4 cnt_reg_5_ ( .RN(n83), .D(N54), .E(enable_ff), .CK(clk), .Q(cnt[5]), 
        .QN(n59) );
  EDFFTRX4 cnt_reg_6_ ( .RN(n83), .D(N55), .E(enable_ff), .CK(clk), .Q(cnt[6]), 
        .QN(n62) );
  DFFQX2 Dout_reg_14_ ( .D(Dout_n[14]), .CK(clk), .Q(n87) );
  DFFQX2 Dout_reg_12_ ( .D(Dout_n[12]), .CK(clk), .Q(n89) );
  DFFQX2 Dout_reg_10_ ( .D(Dout_n[10]), .CK(clk), .Q(n91) );
  DFFQX2 Dout_reg_8_ ( .D(Dout_n[8]), .CK(clk), .Q(n93) );
  DFFQX2 Dout_reg_6_ ( .D(Dout_n[6]), .CK(clk), .Q(n95) );
  DFFQX2 Dout_reg_4_ ( .D(Dout_n[4]), .CK(clk), .Q(n97) );
  DFFQX2 Dout_reg_0_ ( .D(Dout_n[0]), .CK(clk), .Q(n101) );
  DFFQX2 Dout_reg_11_ ( .D(Dout_n[11]), .CK(clk), .Q(n90) );
  DFFQX2 Dout_reg_9_ ( .D(Dout_n[9]), .CK(clk), .Q(n92) );
  DFFQX2 Dout_reg_7_ ( .D(Dout_n[7]), .CK(clk), .Q(n94) );
  DFFQX2 Dout_reg_5_ ( .D(Dout_n[5]), .CK(clk), .Q(n96) );
  DFFQX2 Dout_reg_3_ ( .D(Dout_n[3]), .CK(clk), .Q(n98) );
  DFFQX2 Dout_reg_13_ ( .D(Dout_n[13]), .CK(clk), .Q(n88) );
  DFFQX2 Dout_reg_15_ ( .D(Dout_n[15]), .CK(clk), .Q(n86) );
  DFFQX2 Din_ff_reg_0_ ( .D(Din[0]), .CK(clk), .Q(Din_ff[0]) );
  DFFTRX2 out_valid_reg ( .D(n57), .RN(n83), .CK(clk), .Q(n84), .QN(n64) );
  DFFTRX4 isFull_reg ( .D(n32), .RN(n83), .CK(clk), .Q(isFull), .QN(n61) );
  DFFQX4 Dout_reg_16_ ( .D(Dout_n[16]), .CK(clk), .Q(n85) );
  DFFQX4 Dout_reg_2_ ( .D(Dout_n[2]), .CK(clk), .Q(n99) );
  DFFQX2 Dout_reg_1_ ( .D(Dout_n[1]), .CK(clk), .Q(n100) );
  INVX3 U3 ( .A(reset), .Y(n83) );
  INVXL U4 ( .A(n60), .Y(n1) );
  CLKINVX1 U5 ( .A(n2), .Y(n3) );
  CLKINVX1 U6 ( .A(n63), .Y(n4) );
  INVX1 U7 ( .A(n25), .Y(n28) );
  AND2X6 U8 ( .A(cnt[2]), .B(cnt[3]), .Y(n10) );
  NAND4X6 U9 ( .A(n12), .B(n11), .C(isFull), .D(cnt[3]), .Y(n9) );
  AND2X6 U10 ( .A(cnt[5]), .B(n58), .Y(n15) );
  AND4X6 U11 ( .A(cnt[2]), .B(cnt[4]), .C(cnt[6]), .D(cnt[5]), .Y(n12) );
  AND2X4 U12 ( .A(n60), .B(cnt[1]), .Y(n11) );
  NOR2XL U13 ( .A(n88), .B(Din_ff[14]), .Y(n520) );
  XOR2X4 U14 ( .A(n21), .B(n62), .Y(n22) );
  CLKAND2X8 U15 ( .A(n8), .B(n17), .Y(N52) );
  CLKAND2X8 U16 ( .A(n8), .B(n33), .Y(n6) );
  CLKAND2X8 U17 ( .A(n8), .B(n35), .Y(n5) );
  AOI211X4 U18 ( .A0(Din_ff[10]), .A1(n92), .B0(n550), .C0(n48), .Y(Dout_n[10]) );
  OAI21X1 U19 ( .A0(n20), .A1(n30), .B0(n19), .Y(Dout_n[0]) );
  BUFX20 U20 ( .A(n100), .Y(Dout[1]) );
  NAND4X6 U21 ( .A(n15), .B(n14), .C(n13), .D(n27), .Y(n7) );
  NOR2XL U22 ( .A(n100), .B(Din_ff[2]), .Y(n40) );
  OAI21XL U23 ( .A0(n7), .A1(n56), .B0(n61), .Y(n32) );
  NOR2BX2 U24 ( .AN(n18), .B(n550), .Y(n19) );
  NOR2XL U25 ( .A(n92), .B(Din_ff[10]), .Y(n48) );
  AND2X4 U26 ( .A(cnt[4]), .B(n25), .Y(n21) );
  XOR2X1 U27 ( .A(n31), .B(cnt[2]), .Y(n33) );
  XOR2X1 U28 ( .A(n3), .B(cnt[0]), .Y(n38) );
  XOR2X4 U29 ( .A(n34), .B(n4), .Y(n35) );
  OR2X1 U30 ( .A(isFull), .B(n84), .Y(n57) );
  NOR2X8 U31 ( .A(n7), .B(isFull), .Y(n36) );
  CLKAND2X8 U32 ( .A(n8), .B(n23), .Y(N55) );
  CLKAND2X8 U33 ( .A(n8), .B(n29), .Y(N54) );
  NOR2X8 U34 ( .A(n37), .B(n36), .Y(n8) );
  INVX12 U35 ( .A(n9), .Y(n37) );
  NOR2X4 U36 ( .A(cnt[4]), .B(cnt[6]), .Y(n13) );
  AOI211X1 U37 ( .A0(Din_ff[2]), .A1(n100), .B0(n550), .C0(n40), .Y(Dout_n[2])
         );
  AND2X8 U38 ( .A(n31), .B(n10), .Y(n34) );
  AND2X8 U39 ( .A(cnt[0]), .B(cnt[1]), .Y(n31) );
  NOR2XL U40 ( .A(n86), .B(Din_ff[16]), .Y(n540) );
  NOR2XL U41 ( .A(n101), .B(Din_ff[1]), .Y(n39) );
  INVX3 U42 ( .A(n99), .Y(n30) );
  NOR2X4 U43 ( .A(cnt[0]), .B(cnt[1]), .Y(n14) );
  CLKXOR2X2 U44 ( .A(n58), .B(cnt[3]), .Y(n16) );
  MXI2X2 U45 ( .A(n27), .B(n16), .S0(n31), .Y(n17) );
  INVX16 U46 ( .A(n64), .Y(out_valid) );
  AOI2BB2X2 U47 ( .B0(n85), .B1(Din_ff[0]), .A0N(n85), .A1N(Din_ff[0]), .Y(n20) );
  NAND2X1 U48 ( .A(n20), .B(n30), .Y(n18) );
  NAND2X8 U49 ( .A(isFull), .B(enable_ff), .Y(n550) );
  CLKINVX6 U50 ( .A(n59), .Y(n25) );
  MXI2X4 U51 ( .A(n62), .B(n22), .S0(n34), .Y(n23) );
  BUFX20 U52 ( .A(n86), .Y(Dout[15]) );
  BUFX20 U53 ( .A(n88), .Y(Dout[13]) );
  BUFX20 U54 ( .A(n98), .Y(Dout[3]) );
  BUFX20 U55 ( .A(n96), .Y(Dout[5]) );
  BUFX20 U56 ( .A(n94), .Y(Dout[7]) );
  BUFX20 U57 ( .A(n92), .Y(Dout[9]) );
  BUFX20 U58 ( .A(n90), .Y(Dout[11]) );
  BUFX20 U59 ( .A(n101), .Y(Dout[0]) );
  BUFX20 U60 ( .A(n97), .Y(Dout[4]) );
  BUFX20 U61 ( .A(n95), .Y(Dout[6]) );
  BUFX20 U62 ( .A(n93), .Y(Dout[8]) );
  BUFX20 U63 ( .A(n91), .Y(Dout[10]) );
  BUFX20 U64 ( .A(n89), .Y(Dout[12]) );
  BUFX20 U65 ( .A(n87), .Y(Dout[14]) );
  INVX4 U66 ( .A(n85), .Y(n24) );
  INVX16 U67 ( .A(n24), .Y(Dout[16]) );
  CLKXOR2X2 U68 ( .A(n63), .B(n25), .Y(n26) );
  MXI2X4 U69 ( .A(n28), .B(n26), .S0(n34), .Y(n29) );
  INVX20 U70 ( .A(n30), .Y(Dout[2]) );
  NOR3X1 U71 ( .A(n37), .B(n1), .C(n36), .Y(N49) );
  NOR2BX1 U72 ( .AN(n38), .B(n37), .Y(N50) );
  AOI211X4 U73 ( .A0(Din_ff[1]), .A1(n101), .B0(n550), .C0(n39), .Y(Dout_n[1])
         );
  NOR2X1 U74 ( .A(n99), .B(Din_ff[3]), .Y(n41) );
  AOI211X4 U75 ( .A0(n99), .A1(Din_ff[3]), .B0(n550), .C0(n41), .Y(Dout_n[3])
         );
  NOR2X1 U76 ( .A(n98), .B(Din_ff[4]), .Y(n42) );
  AOI211X4 U77 ( .A0(Din_ff[4]), .A1(n98), .B0(n550), .C0(n42), .Y(Dout_n[4])
         );
  NOR2X1 U78 ( .A(n97), .B(Din_ff[5]), .Y(n43) );
  AOI211X4 U79 ( .A0(Din_ff[5]), .A1(n97), .B0(n550), .C0(n43), .Y(Dout_n[5])
         );
  NOR2X1 U80 ( .A(n96), .B(Din_ff[6]), .Y(n44) );
  AOI211X4 U81 ( .A0(Din_ff[6]), .A1(n96), .B0(n550), .C0(n44), .Y(Dout_n[6])
         );
  NOR2X1 U82 ( .A(n95), .B(Din_ff[7]), .Y(n45) );
  AOI211X4 U83 ( .A0(Din_ff[7]), .A1(n95), .B0(n550), .C0(n45), .Y(Dout_n[7])
         );
  NOR2X1 U84 ( .A(n94), .B(Din_ff[8]), .Y(n46) );
  AOI211X4 U85 ( .A0(Din_ff[8]), .A1(n94), .B0(n550), .C0(n46), .Y(Dout_n[8])
         );
  NOR2X1 U86 ( .A(n93), .B(Din_ff[9]), .Y(n47) );
  AOI211X4 U87 ( .A0(Din_ff[9]), .A1(n93), .B0(n550), .C0(n47), .Y(Dout_n[9])
         );
  NOR2X1 U88 ( .A(n91), .B(Din_ff[11]), .Y(n490) );
  AOI211X4 U89 ( .A0(Din_ff[11]), .A1(n91), .B0(n550), .C0(n490), .Y(
        Dout_n[11]) );
  NOR2X1 U90 ( .A(n90), .B(Din_ff[12]), .Y(n500) );
  AOI211X4 U91 ( .A0(Din_ff[12]), .A1(n90), .B0(n550), .C0(n500), .Y(
        Dout_n[12]) );
  NOR2X1 U92 ( .A(n89), .B(Din_ff[13]), .Y(n51) );
  AOI211X4 U93 ( .A0(Din_ff[13]), .A1(n89), .B0(n550), .C0(n51), .Y(Dout_n[13]) );
  AOI211X4 U94 ( .A0(Din_ff[14]), .A1(n88), .B0(n550), .C0(n520), .Y(
        Dout_n[14]) );
  NOR2X1 U95 ( .A(n87), .B(Din_ff[15]), .Y(n53) );
  AOI211X4 U96 ( .A0(Din_ff[15]), .A1(n87), .B0(n550), .C0(n53), .Y(Dout_n[15]) );
  AOI211X4 U97 ( .A0(Din_ff[16]), .A1(n86), .B0(n550), .C0(n540), .Y(
        Dout_n[16]) );
endmodule


module TOP ( clk, reset, enable, out_valid, Dout );
  output [16:0] Dout;
  input clk, reset, enable;
  output out_valid;
  wire   lfsr_out_valid, lfsr_pat_0_, adder_out_valid, n1,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6;
  wire   [15:0] A;
  wire   [15:0] B;
  wire   [16:0] adder_Dout;

  LFSR U0_LFSR ( .clk(clk), .reset(reset), .enable(enable), .out_valid(
        lfsr_out_valid), .Dout({SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, 
        SYNOPSYS_UNCONNECTED_6, lfsr_pat_0_}) );
  ADDER U0_ADDER ( .clk(clk), .reset(reset), .enable(lfsr_out_valid), .A(A), 
        .B(B), .out_valid(adder_out_valid), .Dout(adder_Dout) );
  MISR U0_MISR ( .clk(clk), .reset(reset), .enable(adder_out_valid), .Din(
        adder_Dout), .out_valid(out_valid), .Dout(Dout) );
  DFFTRX1 random_gen_ff_reg_0_ ( .D(lfsr_pat_0_), .RN(n1), .CK(clk), .Q(A[0])
         );
  DFFTRX1 random_gen_ff_reg_1_ ( .D(A[0]), .RN(n1), .CK(clk), .Q(A[1]) );
  DFFTRX1 random_gen_ff_reg_2_ ( .D(A[1]), .RN(n1), .CK(clk), .Q(A[2]) );
  DFFTRX1 random_gen_ff_reg_3_ ( .D(A[2]), .RN(n1), .CK(clk), .Q(A[3]) );
  DFFTRX1 random_gen_ff_reg_4_ ( .D(A[3]), .RN(n1), .CK(clk), .Q(A[4]) );
  DFFTRX1 random_gen_ff_reg_5_ ( .D(A[4]), .RN(n1), .CK(clk), .Q(A[5]) );
  DFFTRX1 random_gen_ff_reg_6_ ( .D(A[5]), .RN(n1), .CK(clk), .Q(A[6]) );
  DFFTRX1 random_gen_ff_reg_7_ ( .D(A[6]), .RN(n1), .CK(clk), .Q(A[7]) );
  DFFTRX1 random_gen_ff_reg_8_ ( .D(A[7]), .RN(n1), .CK(clk), .Q(A[8]) );
  DFFTRX1 random_gen_ff_reg_9_ ( .D(A[8]), .RN(n1), .CK(clk), .Q(A[9]) );
  DFFTRX1 random_gen_ff_reg_10_ ( .D(A[9]), .RN(n1), .CK(clk), .Q(A[10]) );
  DFFTRX1 random_gen_ff_reg_11_ ( .D(A[10]), .RN(n1), .CK(clk), .Q(A[11]) );
  DFFTRX1 random_gen_ff_reg_12_ ( .D(A[11]), .RN(n1), .CK(clk), .Q(A[12]) );
  DFFTRX1 random_gen_ff_reg_13_ ( .D(A[12]), .RN(n1), .CK(clk), .Q(A[13]) );
  DFFTRX1 random_gen_ff_reg_14_ ( .D(A[13]), .RN(n1), .CK(clk), .Q(A[14]) );
  DFFTRX1 random_gen_ff_reg_15_ ( .D(A[14]), .RN(n1), .CK(clk), .Q(A[15]) );
  DFFTRX1 random_gen_ff_reg_16_ ( .D(A[15]), .RN(n1), .CK(clk), .Q(B[0]) );
  DFFTRX1 random_gen_ff_reg_17_ ( .D(B[0]), .RN(n1), .CK(clk), .Q(B[1]) );
  DFFTRX1 random_gen_ff_reg_18_ ( .D(B[1]), .RN(n1), .CK(clk), .Q(B[2]) );
  DFFTRX1 random_gen_ff_reg_19_ ( .D(B[2]), .RN(n1), .CK(clk), .Q(B[3]) );
  DFFTRX1 random_gen_ff_reg_20_ ( .D(B[3]), .RN(n1), .CK(clk), .Q(B[4]) );
  DFFTRX1 random_gen_ff_reg_21_ ( .D(B[4]), .RN(n1), .CK(clk), .Q(B[5]) );
  DFFTRX1 random_gen_ff_reg_22_ ( .D(B[5]), .RN(n1), .CK(clk), .Q(B[6]) );
  DFFTRX1 random_gen_ff_reg_23_ ( .D(B[6]), .RN(n1), .CK(clk), .Q(B[7]) );
  DFFTRX1 random_gen_ff_reg_24_ ( .D(B[7]), .RN(n1), .CK(clk), .Q(B[8]) );
  DFFTRX1 random_gen_ff_reg_25_ ( .D(B[8]), .RN(n1), .CK(clk), .Q(B[9]) );
  DFFTRX1 random_gen_ff_reg_26_ ( .D(B[9]), .RN(n1), .CK(clk), .Q(B[10]) );
  DFFTRX1 random_gen_ff_reg_27_ ( .D(B[10]), .RN(n1), .CK(clk), .Q(B[11]) );
  DFFTRX1 random_gen_ff_reg_28_ ( .D(B[11]), .RN(n1), .CK(clk), .Q(B[12]) );
  DFFTRX1 random_gen_ff_reg_29_ ( .D(B[12]), .RN(n1), .CK(clk), .Q(B[13]) );
  DFFTRX1 random_gen_ff_reg_30_ ( .D(B[13]), .RN(n1), .CK(clk), .Q(B[14]) );
  DFFTRX1 random_gen_ff_reg_31_ ( .D(B[14]), .RN(n1), .CK(clk), .Q(B[15]) );
  INVX8 U4 ( .A(reset), .Y(n1) );
endmodule

