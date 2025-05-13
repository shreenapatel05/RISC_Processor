module RISCprocessor(clk, Reset, InpExtWorld1, InpExtWorld2, InpExtWorld3, InpExtWorld4, OutExtWorld1, OutExtWorld2, OutExtWorld3, OutExtWorld4);
  
  input clk;
  input Reset;
  input [7:0] InpExtWorld1;
  input [7:0] InpExtWorld2;
  input [7:0] InpExtWorld3;
  input [7:0] InpExtWorld4;
  output reg [7:0] OutExtWorld1;  
  output reg [7:0] OutExtWorld2;
  output reg [7:0] OutExtWorld3;
  output reg [7:0] OutExtWorld4;
 
  wire [7:0] Imm;
  wire [4:0] Opcode;
  wire [7:0] Address;
  wire [7:0] PC, PC_D1;
  wire UpdatePC;
  reg T0, T1, T2, T3, T4, T5;
  wire [24:0] Dataout;
  wire [3:0] Z, X, Y;
  wire Reg_W, Reg_R;
  reg [7:0] RX, RY;
  wire [7:0] mux3;
  wire [7:0] Operand1;
  wire ALU_Save, C_Save, Z_Save;
  wire Zero_flag, Carry_flag;
  wire [7:0] Operand2;
  wire [7:0] ALUout;
  wire [7:0] Dout_SRAM, Dout_Stack, Dout_INPort, Datain;
  wire SRAM_R, SRAM_W, INport_R, OUTport_W, Stack_R, Stack_W;
  wire Zflag, Cflag, OUTPort_W, INPort_R; 
  
  // PC + InstMEM
  Mux32to1_8bit inst1(8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, Imm, Imm, Imm, Imm, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, ALUout, ALUout, 8'b0, 8'b0, 8'b0, Opcode, Address);
  ProgCounter inst2(clk, Reset, T0, UpdatePC, Address, PC, PC_D1);
  InstMEM inst3(clk, Reset, PC, T0, Dataout, Opcode, Z, X, Y, Imm);
  
  // Reg file
  Mux32to1_8bit inst4(8'b0, ALUout, ALUout, ALUout, ALUout, ALUout, ALUout, ALUout, ALUout, ALUout, ALUout, Dout_SRAM, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, Dout_Stack, Dout_INPort, 8'b0, Dout_SRAM, 8'b0, ALUout, ALUout, ALUout, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, Opcode, Datain);
  RegisterFile inst5(clk, Reset, Reg_R, Reg_W, Datain, X, Y, Z, RX, RY);
  
  // SRAM 
  Mux32to1_8bit inst6(8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, Imm, Imm, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, RX, RX, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, Opcode, mux3);
  SRAM inst7(clk, Reset, mux3, SRAM_R, SRAM_W, ALUout, Dout_SRAM);
  
  //ALU
  Mux32to1_8bit inst8(8'b0, RX, RX, RX, RX, RX, RX, RX, RX, RX, 8'b0, 8'b0, RX, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, RX, 8'b0, 8'b0, RX, 8'b0, 8'b0, RX, RX, RX, PC_D1, PC_D1, 8'b0, 8'b0, 8'b0, Opcode, Operand1);
  Mux32to1_8bit inst9(8'b0, RY, RY, RY, RY, Imm, Imm, Imm, Imm, 8'b0, Imm, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, RY, RY, RY, RY, {Imm[0], Imm[1], Imm[2], Imm[3], Imm[4], Imm[5], Imm[6], 1'b0}, {Imm[0], Imm[1], Imm[2], Imm[3], Imm[4], Imm[5], Imm[6], 1'b0}, 8'b0, 8'b0, 8'b0, Opcode, Operand2);
  ALU inst10(clk, Reset, Imm[7], Operand1, Operand2, Opcode, ALU_Save, Z_Save, C_Save, ALUout, Zero_flag, Carry_flag);
	
  //timing gen 
  TimingGen inst11(clk, Reset, T0, T1, T2, T3, T4);
  
  //INport
  INport inst12(clk, Reset, INport_R, InpExtWorld1, InpExtWorld2, InpExtWorld3, InpExtWorld4, Address, Dout_INPort);
  
  //OUTport
  OUTport inst13(clk, Reset, Imm, ALUout, OUTport_W, OutExtWorld1, OutExtWorld2, OutExtWorld3, OutExtWorld4);
  
  //Stack
  Stack inst14(clk, Reset, Stack_R, Stack_W, ALUout, Dout_Stack);
  
  //Control logic
   ControlLogic inst15(Opcode, clk, Reset, Zflag, Cflag, T1, T2, T3, T4, SRAM_W, SRAM_R, Reg_R, Reg_W, ALU_Save, Z_Save, C_Save, Stack_W, Stack_R, OUTPort_W, INPort_R, UpdatePC);
      
endmodule