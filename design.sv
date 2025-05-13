/////////////////////////////////////////

module Mux32to1_8bit(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, S, Y);
  	input [4:0] S; 
	input [7:0] I0;  
	input [7:0] I1;  
	input [7:0] I2;  
	input [7:0] I3;  
	input [7:0] I4;  
	input [7:0] I5;  
	input [7:0] I6; 
	input [7:0] I7;
	input [7:0] I8;  
	input [7:0] I9;  
	input [7:0] I10; 
	input [7:0] I11;
	input [7:0] I12;  
	input [7:0] I13; 
    input [7:0] I14;  
    input [7:0] I15;
  	input [7:0] I16;  
  	input [7:0] I17;  
  	input [7:0] I18;  
 	input [7:0] I19;  
  	input [7:0] I20;  
  	input [7:0] I21;  
  	input [7:0] I22; 
 	input [7:0] I23;
  	input [7:0] I24;  
  	input [7:0] I25;  
  	input [7:0] I26; 
  	input [7:0] I27;
  	input [7:0] I28;  
  	input [7:0] I29; 
  	input [7:0] I30;  
  	input [7:0] I31;
	output reg [7:0] Y;   
	
always @(*)
	begin
			case(S)
				5'b00000: Y = I0;
				5'b00001: Y = I1;
				5'b00010: Y = I2;
				5'b00011: Y = I3;
				5'b00100: Y = I4;
				5'b00101: Y = I5;
				5'b00110: Y = I6;
				5'b00111: Y = I7;
				5'b01000: Y = I8;
				5'b01001: Y = I9;
				5'b01010: Y = I10;
				5'b01011: Y = I11;
				5'b01100: Y = I12;
				5'b01101: Y = I13;
				5'b01110: Y = I14;
				5'b01111: Y = I15;
				5'b10000: Y = I16;
				5'b10001: Y = I17;
				5'b10010: Y = I18;
				5'b10011: Y = I19;
				5'b10100: Y = I20;
				5'b10101: Y = I21;
				5'b10110: Y = I22;
				5'b10111: Y = I23;
				5'b11000: Y = I24;
				5'b11001: Y = I25;
				5'b11010: Y = I26;
				5'b11011: Y = I27;
				5'b11100: Y = I28;
				5'b11101: Y = I29;
				5'b11110: Y = I30;
				5'b11111: Y = I31;
				default:
					Y = 8'b0000_0000;
			endcase	
		end 
endmodule 

/////////////////////////////////////////

module Mux32to1_1bit(S, E, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, Y);
  input [4:0] S;
  input E;
  input I0;
  input I1; 
  input I2; 
  input I3; 
  input I4; 
  input I5; 
  input I6; 
  input I7;
  input I8;
  input I9;
  input I10;
  input I11; 
  input I12; 
  input I13; 
  input I14;
  input I15;
  input I16; 
  input I17; 
  input I18; 
  input I19; 
  input I20;
  input I21; 
  input I22; 
  input I23;
  input I24;
  input I25;
  input I26; 
  input I27; 
  input I28; 
  input I29; 
  input I30; 
  input I31;
  output reg Y;  
  
always @(*) begin
  if (E) begin
    case(S)
        5'b00000: Y = I0;
        5'b00001: Y = I1;
        5'b00010: Y = I2;
        5'b00011: Y = I3;
        5'b00100: Y = I4;
        5'b00101: Y = I5;
        5'b00110: Y = I6;
        5'b00111: Y = I7;
        5'b01000: Y = I8;
        5'b01001: Y = I9;
        5'b01010: Y = I10;
        5'b01011: Y = I11;
        5'b01100: Y = I12;
        5'b01101: Y = I13;
        5'b01110: Y = I14;
        5'b01111: Y = I15;
        5'b10000: Y = I16;
        5'b10001: Y = I17;
        5'b10010: Y = I18;
        5'b10011: Y = I19;
        5'b10100: Y = I20;
        5'b10101: Y = I21;
        5'b10110: Y = I22;
        5'b10111: Y = I23;
        5'b11000: Y = I24;
        5'b11001: Y = I25;
        5'b11010: Y = I26;
        5'b11011: Y = I27;
        5'b11100: Y = I28;
        5'b11101: Y = I29;
        5'b11110: Y = I30;
        5'b11111: Y = I31;
         default:  Y = 1'b0;  
        endcase
  		end
    end 
endmodule

/////////////////////////////////////////////////////////////////

module decoder3to8_withoutE(A, D);
  input [2:0] A;   
  output wire [7:0] D;   
	
  and inst1(D[0], ~A[2], ~A[1], ~A[0]);
  and inst2(D[1], ~A[2], ~A[1], A[0]);
  and inst3(D[2], ~A[2], A[1], ~A[0]);
  and inst4(D[3], ~A[2], A[1], A[0]);
  and inst5(D[4], A[2], ~A[1], ~A[0]);
  and inst6(D[5], A[2], ~A[1], A[0]);
  and inst7(D[6], A[2], A[1], ~A[0]);
  and inst8(D[7], A[2], A[1], A[0]);

endmodule

/////////////////////////////////////////////////////////////////

module Mux8to1_withoutE(I, S, Cout);
  input [2:0] S;  
  input [7:0] I;  
  output wire Cout;   
	
  wire [7:0] Dtemp;
  assign I = 8'b11101000;
  
  and inst1(Dtemp[0], ~S[2], ~S[1], ~S[0], I[0]);
  and inst2(Dtemp[1], ~S[2], ~S[1], S[0], I[1]);
  and inst3(Dtemp[2], ~S[2], S[1], ~S[0], I[2]);
  and inst4(Dtemp[3], ~S[2], S[1], S[0], I[3]);
  and inst5(Dtemp[4], S[2], ~S[1], ~S[0], I[4]);
  and inst6(Dtemp[5], S[2], ~S[1], S[0], I[5]);
  and inst7(Dtemp[6], S[2], S[1], ~S[0], I[6]);
  and inst8(Dtemp[7], S[2], S[1], S[0], I[7]);
	
  or inst9(Cout,Dtemp[7],Dtemp[6],Dtemp[5],Dtemp[4],Dtemp[3],Dtemp[2],Dtemp[1],Dtemp[0]);

endmodule

/////////////////////////////////////////////////////////////////

module Full_Adder(A, B, Cin, I, Sum, Cout);
  input A;
  input B;
  input Cin;
  input [7:0] I;
  output wire Sum;
  output wire Cout;
  
  wire [7:0] D;
  
  decoder3to8_withoutE inst1({A,B,Cin}, D);
  or inst3(Sum, D[7], D[4], D[2], D[1]);
  Mux8to1_withoutE inst2(I, {A,B,Cin}, Cout);
  
endmodule

/////////////////////////////////////////////////////////////////

module RippleCarryAdder(A, B, Cin, Sum, Cout, C7);
  input [7:0] A;
  input [7:0] B;
  input wire Cin;
  output wire [7:0] Sum;
  output wire Cout;
  output reg C7;
  
  wire C1,C2,C3,C4,C5,C6;
  wire [7:0] I;
  
  Full_Adder inst20(A[0], B[0], Cin, I, Sum[0], C1);
  Full_Adder inst21(A[1], B[1], C1, I, Sum[1], C2);
  Full_Adder inst22(A[2], B[2], C2, I, Sum[2], C3);
  Full_Adder inst23(A[3], B[3], C3, I, Sum[3], C4);
  Full_Adder inst24(A[4], B[4], C4, I, Sum[4], C5);
  Full_Adder inst25(A[5], B[5], C5, I, Sum[5], C6);
  Full_Adder inst26(A[6], B[6], C6, I, Sum[6], C7);
  Full_Adder inst27(A[7], B[7], C7, I, Sum[7], Cout);
  
endmodule

/////////////////////////////////////////////////////////////////

module adder_subtractor(A, B, M, S, Cout);
  input [7:0] A, B;
  input M;
  output wire [7:0] S;
  output wire Cout;
  
  wire [7:0] tempB;
  wire C7;
  
  xor inst0(tempB[0], B[0], M);
  xor inst1(tempB[1], B[1], M);
  xor inst2(tempB[2], B[2], M);
  xor inst3(tempB[3], B[3], M);
  xor inst4(tempB[4], B[4], M);
  xor inst5(tempB[5], B[5], M);
  xor inst6(tempB[6], B[6], M);
  xor inst7(tempB[7], B[7], M);
  
  RippleCarryAdder inst8(A, tempB, M, S, Cout, C7);
  
endmodule

/////////////////////////////////////////////////////////////////

module RightShifter(A, Shift, RShiftAnswer);
  input [7:0] A;     
  input [2:0] Shift;  
  output [7:0] RShiftAnswer;
    assign RShiftAnswer = A >> Shift;
endmodule

/////////////////////////////////////////////////////////////////

module LeftShifter(A, Shift, LShiftAnswer);
  input [7:0] A;     
  input [2:0] Shift;  
  output [7:0] LShiftAnswer;
    assign LShiftAnswer = A << Shift; 
endmodule

/////////////////////////////////////////////////////////////////

module eightbitRegwithLoad(clk, Datain, Reset, Load, Dataout);
  input clk; 
  input Load; 
  input Reset;
input [7:0] Datain;
output reg [7:0] Dataout;

wire [7:0] Y;

  assign Y = (Load == 1'b1)? Datain: Dataout; 
always @(posedge clk)
	begin
      		if(Reset == 1'b1)
				Dataout<=8'b0000_0000;
			else
				Dataout<=Y;
	end
endmodule

/////////////////////////////////////////////////////////////////

module onebitRegwithLoad(clk, Load, Reset, Datain, Dataout);
  input clk, Load, Reset;
  input Datain;
  output reg Dataout;
  
  always @(posedge clk) begin
    if (Reset) begin
      Dataout <= 1'b0;
    end else if (Load) begin
      Dataout <= Datain;
    end
  end
endmodule

/////////////////////////////////////////////////////////////////

module ALU(clk, Reset, Imm7, Operand1, Operand2, Opcode, ALUSave, ZflagSave, CflagSave, ALUout_D1, Zflag, Cflag);
  	input clk;
    input Reset;
    input Imm7;
    input [7:0] Operand1;
    input [7:0] Operand2;
    input [4:0] Opcode;
    input ALUSave;
    input ZflagSave;
    input CflagSave;
  	output reg [7:0] ALUout_D1;
    output reg Zflag;
    output reg Cflag;

  wire Y, y;
  wire inverted;
  wire [7:0] Sum;
  wire Cout;
  wire [7:0] AndResult, OrResult, XorResult; 
  wire [7:0] RShift, LShift; 
  wire [7:0] aluout;
  wire Zero;
  wire cflag;
  wire [7:0] Temp;
  wire C;
  wire [7:0] ALUout;
  
    Mux32to1_1bit inst70(Opcode, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, Imm7, 1'b0, Imm7, 1'b0, 1'b0, y);
    adder_subtractor inst11(Operand1, Operand2, y, Sum, Cout);
  
  assign AndResult = Operand1 & Operand2;
  assign OrResult  = Operand1 | Operand2;
  assign XorResult = Operand1 ^ Operand2;
  
  RightShifter inst5(Operand1, {Operand2[0], Operand2[1], Operand2[2]}, RShift);
  LeftShifter inst6(Operand1, {Operand2[0], Operand2[1], Operand2[2]}, LShift);
  
   Mux32to1_8bit inst4(Sum, AndResult, OrResult, XorResult, Sum, AndResult, OrResult, XorResult, Sum, Sum, Sum, 8'b0, Sum, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, Sum, 8'b0, 8'b0, Sum, 8'b0, Sum, Sum, RShift, LShift, Sum, Sum, 8'b0, 8'b0, 8'b0, Opcode, aluout);
    
  Mux32to1_1bit inst7(Opcode, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Cout, 1'b0, 1'b0, 1'b0, Cout, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, Cout, Operand1[0], Operand1[7], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, cflag);
  
   assign Zero = ~|aluout;
  
  eightbitRegwithLoad inst8(clk, aluout, Reset, ALUSave, ALUout);
  eightbitRegwithLoad Aluout(clk, ALUout, 1'b0, 1'b1, ALUout_D1);
  onebitRegwithLoad inst9(clk, ZflagSave, Reset, Zero, Zflag);
  onebitRegwithLoad inst10(clk, CflagSave, Reset, cflag, Cflag);
endmodule

//////////////////////////////////////////

module decoder4to16_withE(A, E, D);
  input [3:0] A;  
  input E;        
  output wire [15:0] D;   
	
  and inst1(D[0], E, ~A[3], ~A[2], ~A[1], ~A[0]);
  and inst2(D[1], E, ~A[3], ~A[2], ~A[1], A[0]);
  and inst3(D[2], E, ~A[3], ~A[2], A[1], ~A[0]);
  and inst4(D[3], E, ~A[3], ~A[2], A[1], A[0]);
  and inst5(D[4], E, ~A[3], A[2], ~A[1], ~A[0]);
  and inst6(D[5], E, ~A[3], A[2], ~A[1], A[0]);
  and inst7(D[6], E, ~A[3], A[2], A[1], ~A[0]);
  and inst8(D[7], E, ~A[3], A[2], A[1], A[0]);
  and inst9(D[8], E, A[3], ~A[2], ~A[1], ~A[0]);
  and inst10(D[9], E, A[3], ~A[2], ~A[1], A[0]);
  and inst11(D[10], E, A[3], ~A[2], A[1], ~A[0]);
  and inst12(D[11], E, A[3], ~A[2], A[1], A[0]);
  and inst13(D[12], E, A[3], A[2], ~A[1], ~A[0]);
  and inst14(D[13], E, A[3], A[2], ~A[1], A[0]);
  and inst15(D[14], E, A[3], A[2], A[1], ~A[0]);
  and inst16(D[15], E, A[3], A[2], A[1], A[0]);

endmodule

///////////////////////////////////////

module Mux16to1_8bit(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, S, E, Y);
    input [3:0] S;  
	input E;      
	input [7:0] I0;  
	input [7:0] I1;  
	input [7:0] I2;  
	input [7:0] I3;  
	input [7:0] I4;  
	input [7:0] I5;  
	input [7:0] I6; 
	input [7:0] I7;
	input [7:0] I8;  
	input [7:0] I9;  
	input [7:0] I10; 
	input [7:0] I11;
	input [7:0] I12;  
	input [7:0] I13; 
    input [7:0] I14;  
    input [7:0] I15;
	output reg [7:0] Y;   
	
  always @(*) begin
      case(S)
				4'b0000: Y = I0;
				4'b0001: Y = I1;
				4'b0010: Y = I2;
				4'b0011: Y = I3;
				4'b0100: Y = I4;
				4'b0101: Y = I5;
				4'b0110: Y = I6;
				4'b0111: Y = I7;
				4'b1000: Y = I8;
				4'b1001: Y = I9;
				4'b1010: Y = I10;
				4'b1011: Y = I11;
				4'b1100: Y = I12;
				4'b1101: Y = I13;
				4'b1110: Y = I14;
				4'b1111: Y = I15;
				default:
					Y = 8'b0000_0000;
			endcase	
		end
endmodule

///////////////////////////////////////

module RegisterFile(clk, Reset, RegFileRead, RegFileWrite, Datain, Source1, Source2, Destin, Dataout1, Dataout2);
    input clk; 
  	input Reset;
    input RegFileRead; 
    input RegFileWrite;
    input [7:0] Datain;
    input [3:0] Source1;
    input [3:0] Source2;
    input [3:0] Destin;
    output reg [7:0] Dataout1;
    output reg [7:0] Dataout2;

  wire [15:0] D;
  wire [7:0] Data0;
  wire [7:0] Data1;
  wire [7:0] Data2;
  wire [7:0] Data3;
  wire [7:0] Data4;
  wire [7:0] Data5;
  wire [7:0] Data6;
  wire [7:0] Data7;
  wire [7:0] Data8;
  wire [7:0] Data9;
  wire [7:0] Data10;
  wire [7:0] Data11;
  wire [7:0] Data12;
  wire [7:0] Data13;
  wire [7:0] Data14;
  wire [7:0] Data15;
  
  wire [7:0] Y1;
  wire [7:0] Y2;
  
  decoder4to16_withE inst21(Destin, RegFileWrite, D);
  	
  eightbitRegwithLoad inst1(clk, Datain, Reset, D[0], Data0);  
  eightbitRegwithLoad inst2(clk, Datain, Reset, D[1], Data1);
  eightbitRegwithLoad inst3(clk, Datain, Reset, D[2], Data2);
  eightbitRegwithLoad inst4(clk, Datain, Reset, D[3], Data3);
  eightbitRegwithLoad inst5(clk, Datain, Reset, D[4], Data4);
  eightbitRegwithLoad inst6(clk, Datain, Reset, D[5], Data5);  
  eightbitRegwithLoad inst7(clk, Datain, Reset, D[6], Data6);
  eightbitRegwithLoad inst8(clk, Datain, Reset, D[7], Data7);
  eightbitRegwithLoad inst9(clk, Datain, Reset, D[8], Data8);
  eightbitRegwithLoad inst10(clk, Datain, Reset, D[9], Data9);
  eightbitRegwithLoad inst11(clk, Datain, Reset, D[10], Data10);  
  eightbitRegwithLoad inst12(clk, Datain, Reset, D[11], Data11);
  eightbitRegwithLoad inst13(clk, Datain, Reset, D[12], Data12);
  eightbitRegwithLoad inst14(clk, Datain, Reset, D[13], Data13);
  eightbitRegwithLoad inst15(clk, Datain, Reset, D[14], Data14);
  eightbitRegwithLoad inst16(clk, Datain, Reset, D[15], Data15);
  
  Mux16to1_8bit inst17(Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Source1, 1'b1, Y1);
  Mux16to1_8bit inst18(Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Source2, 1'b1, Y2);
  
  eightbitRegwithLoad inst19(clk, Y1, Reset, RegFileRead, Dataout1);
  eightbitRegwithLoad inst20(clk, Y2, Reset, RegFileRead, Dataout2);
  	
endmodule


/////////////////////////////////////////

module DFFwithSynReset(clk, D, Rst, Q);
    input clk, Rst;
    input [7:0] D;
    output reg [7:0] Q;
    
    always @(posedge clk or posedge Rst)
    begin
        if (Rst) 
            Q <= 8'b00000000;  
        else
            Q <= D;            
    end
endmodule

module MUX2to1(sel, A, B, Y);
    input sel;
    input [7:0] A, B;
    output reg [7:0] Y;
    
    always @(*) 
    begin
        if (sel)
            Y = B;
        else
            Y = A;
    end
endmodule

/////////////////////////////////////////

module Counter(clk, Reset, Enable, mux_O, d_Out, Q);
    input clk, Reset, Enable;
    input [7:0] mux_O;
    input [7:0] d_Out;
    output reg [7:0] Q;
    
    always @(posedge clk or posedge Reset) begin
        if (Reset)
            Q <= 8'b00000000;  
        else if (Enable)
            Q <= d_Out + mux_O; 
    end
endmodule

/////////////////////////////////////////

module ProgCounter (clk, Reset, PCenable, PCupdate, NewCAddress, PC, PC_D1);

  input clk; 
  input Reset;
  input PCenable;
  input PCupdate; 
  input [7:0] NewCAddress; 
  output reg [7:0] PC; 
  output reg [7:0] PC_D1;
  
    wire [7:0] mux_out;
    wire [7:0] Cout;
    wire [7:0] Mux2out;
  
  MUX2to1 inst1(PCenable, 8'b00000000, 8'b00000001, mux_out);
  Counter inst2(clk, Reset, PCenable, mux_out, PC, Cout); 
  MUX2to1 inst3(PCupdate, Cout, NewCAddress, Mux2out);
  DFFwithSynReset inst4(clk, Mux2out, Reset, PC);
  DFFwithSynReset inst5(clk, PC, Reset, PC_D1);

endmodule

/////////////////////////////////////////

module SRAM(clk, Reset, Address, SRAMRead, SRAMWrite, Datain, Dataout);
  	input clk;
	input Reset;
    input [7:0] Address;
	input SRAMRead;
	input SRAMWrite;
  	input [7:0] Datain;
  	output reg [7:0] Dataout;
  
  	reg [7:0] datamem [0:255];
  
  	always @(posedge clk or posedge Reset) begin
        if (Reset) begin
            Dataout <= 8'b0;
        end else if (SRAMWrite) begin
            datamem[Address] <= Datain;
        end
    end

    always @(*) begin
        if (SRAMRead)
            Dataout = datamem[Address];
    end  
endmodule

/////////////////////////////////////////

module InstMEM (
    input clk,
    input Reset,
    input [7:0] Address,
    input InstRead,
    output reg [24:0] Dataout,
    output reg [4:0] Opcode,
    output reg [3:0] Destin,
    output reg [3:0] Source1,
    output reg [3:0] Source2,
    output reg [7:0] Imm
);

    reg [24:0] instmemory [0:255];

    initial begin
        $readmemb("instructions.mem", instmemory);
    end

    always @(posedge clk or posedge Reset) begin
        if (Reset) begin
            Dataout <= 25'b0;
            Opcode  <= 5'b0;
            Destin  <= 4'b0;
            Source1 <= 4'b0;
            Source2 <= 4'b0;
            Imm     <= 8'b0;
        end else if (InstRead) begin
            Dataout <= instmemory[Address];
            Opcode  <= instmemory[Address][24:20];  
            Destin  <= instmemory[Address][19:16]; 
            Source1 <= instmemory[Address][15:12]; 
            Source2 <= instmemory[Address][11:8];  
            Imm     <= instmemory[Address][7:0];   
        end
    end

endmodule

/////////////////////////////////////////

module decoder3to8_withE(A, E, D);
    input [2:0] A;
    input E;
    output reg [7:0] D;
    
    always @(*)
    begin
        if (E)
            D = 8'b00000001 << A; 
        else
            D = 8'b00000000;
    end
endmodule

/////////////////////////////////////////

module MUX2to1_3bit(sel, A, B, Y);
    input sel;
  	input [2:0] A, B;
  	output reg [2:0] Y;
    
    always @(*) 
    begin
        if (sel)
            Y = B;
        else
            Y = A;
    end
endmodule

/////////////////////////////////////////

module Adder3bit(A, B, reset, Sum);
  input [2:0] A;
  input [2:0] B;
  input reset;
  output reg [2:0] Sum;

    always @(*) begin
        if (reset)
            Sum = 3'b000;
        else
            Sum = A + B;
    end

endmodule

/////////////////////////////////////////

module threebitRegwithLoad(clk, Datain, Reset, Load, Dataout);
  input clk; 
  input Load; 
  input Reset;
  input [2:0] Datain;  
  output reg [2:0] Dataout;  

  wire [2:0] Y;

  assign Y = (Load == 1'b1) ? Datain : Dataout; 

  always @(posedge clk)
  begin
    if (Reset == 1'b1)
      Dataout <= 3'b000;  
    else
      Dataout <= Y;
  end
endmodule

/////////////////////////////////////////

module TimingGen(
    input clk,
    input reset,
    output reg T0, T1, T2, T3, T4
);

    reg [2:0] state;  // 3-bit state variable: 0 to 4

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= 3'd0;  // Start from T0 on reset
        else
            state <= (state == 3'd4) ? 3'd0 : state + 3'd1;
    end

    always @(*) begin
        // Default all low
        T0 = 0;
        T1 = 0;
        T2 = 0;
        T3 = 0;
        T4 = 0;

        case (state)
            3'd0: T0 = 1;
            3'd1: T1 = 1;
            3'd2: T2 = 1;
            3'd3: T3 = 1;
            3'd4: T4 = 1;
        endcase
    end

endmodule

/////////////////////////////////////////

module Mux4to1_withoutE_method2(S, I0, I1, I2, I3, Y);  
  input [1:0] S;       
  input [7:0] I0, I1, I2, I3;  
  output reg [7:0] Y;
	
always @(*) begin
    case(S)
        2'b00: Y = I0;
        2'b01: Y = I1;
        2'b10: Y = I2;
        2'b11: Y = I3;
        default: Y = 8'b00000000;
    endcase	 
end 
endmodule

/////////////////////////////////////////

module comparator (addr, match, match_out);
  input [7:0] addr, match;
  output reg match_out;
  
    always @(*) 
        match_out = (addr == match) ? 1'b1 : 1'b0;
endmodule

/////////////////////////////////////////

module priority_encoder (match_signals, encoded_out);
  input [3:0] match_signals;
  output reg [1:0] encoded_out;
    
  always @(*) begin
        case(match_signals)
            4'b0001: encoded_out = 2'b00;
            4'b001?: encoded_out = 2'b01;
            4'b01??: encoded_out = 2'b10;
            4'b1???: encoded_out = 2'b11;
            default: encoded_out = 2'b00;
        endcase
    end
endmodule

/////////////////////////////////////////

module INport(clk, Reset, INportRead, InpExtWorld1, InpExtWorld2, InpExtWorld3, InpExtWorld4, Address, Dataout);
    input clk, Reset, INportRead;
  input [7:0] InpExtWorld1, InpExtWorld2, InpExtWorld3, InpExtWorld4;
  input [7:0] Address;
  output [7:0] Dataout;
  
  wire [7:0] d1out, d2out, d3out, d4out;
    wire cm1, cm2, cm3, cm4;
    wire [1:0] pout;
    wire [7:0] mout; 

    eightbitRegwithLoad inst1(clk, InpExtWorld1, Reset, 1'b1, d1out);
    eightbitRegwithLoad inst2(clk, InpExtWorld2, Reset, 1'b1, d2out);
    eightbitRegwithLoad inst3(clk, InpExtWorld3, Reset, 1'b1, d3out);
    eightbitRegwithLoad inst4(clk, InpExtWorld4, Reset, 1'b1, d4out);

    comparator inst5(Address, 8'b11110001, cm1);
    comparator inst6(Address, 8'b11110010, cm2);
    comparator inst7(Address, 8'b11110011, cm3);
    comparator inst8(Address, 8'b11110100, cm4);

    priority_encoder inst9({cm4, cm3, cm2, cm1}, pout);

    Mux4to1_withoutE_method2 inst10(pout, d1out, d2out, d3out, d4out, mout);

    eightbitRegwithLoad inst11(clk, mout, Reset, INportRead, Dataout);
endmodule

/////////////////////////////////////////

module OUTport (clk, Reset, Address, Datain, OUTportWrite, OutExtWorld1, OutExtWorld2, OutExtWorld3, OutExtWorld4);
  input clk;
  input Reset;
  input [7:0] Address;
  input [7:0] Datain;
  input OUTportWrite;
  output [7:0] OutExtWorld1;
  output [7:0] OutExtWorld2;
  output [7:0] OutExtWorld3;
  output [7:0] OutExtWorld4;
  
  wire cm1, cm2, cm3, cm4;
  wire A1, A2, A3, A4;         
  
    comparator inst5(Address, 8'b11111000, cm1);
    comparator inst6(Address, 8'b11111001, cm2);
    comparator inst7(Address, 8'b11111010, cm3);
    comparator inst8(Address, 8'b11111011, cm4);

  assign A1 = cm1 & OUTportWrite;
  assign A2 = cm2 & OUTportWrite;
  assign A3 = cm3 & OUTportWrite;
  assign A4 = cm4 & OUTportWrite;
  
  eightbitRegwithLoad inst9(clk, Datain, Reset, A1, OutExtWorld1);
  eightbitRegwithLoad inst10(clk, Datain, Reset, A2, OutExtWorld2);
  eightbitRegwithLoad inst11(clk, Datain, Reset, A3, OutExtWorld3);
  eightbitRegwithLoad inst12(clk, Datain, Reset, A4, OutExtWorld4);
endmodule

/////////////////////////////////////////

module SRAM_Dummy(clk, x, address, Din, Dout);
  input clk;
  input x;
  input [7:0] address;
  input [7:0] Din;
  output reg [7:0] Dout; 
  
  reg [7:0] memory [255:0];

    always @(posedge clk) begin
      if (x)
        memory[address] <= Din;
      Dout <= memory[address];
    end
endmodule

/////////////////////////////////////////

module StackPointer (clk, reset, increment, decrement, stackp);
    input clk;
    input reset;
    input increment, decrement;
  output reg [7:0] stackp;
  
  always @(posedge clk or posedge reset) begin
    if (reset)
            stackp <= 8'b11111111; 
      else if (increment)
            stackp <= stackp + 1;
      else if (decrement)
            stackp <= stackp - 1;
    end
endmodule

///////////////////////////////////////// 

module Stack (clk, Reset, StackRead, StackWrite, Datain, Dataout);
  input clk, Reset, StackRead, StackWrite;
  input [7:0] Datain;
  output [7:0] Dataout;
  
    wire [7:0] stackp;
    wire [7:0] sram_dout;
    wire x;

    StackPointer inst1(clk, Reset, StackWrite, StackRead, stackp);
	SRAM_Dummy inst2(clk, x, stackp, Datain, sram_dout);
  
    assign x = StackWrite;
    assign Dataout = sram_dout;

endmodule

/////////////////////////////////////////

module ControlLogic(Opcode, clk, Reset, Zflag, Cflag, T1, T2, T3, T4, SRAM_W, SRAM_R, Reg_R, Reg_W, ALU_Save, Z_Save, C_Save, Stack_W, Stack_R, OUTPort_W, INPort_R, UpdatePC);
   
  input [4:0] Opcode;
  	input clk, Reset;
 	input Zflag, Cflag;
    input T1, T2, T3, T4;
    output SRAM_W, SRAM_R, Reg_R, Reg_W;
    output ALU_Save, Z_Save, C_Save, Stack_W, Stack_R;
    output OUTPort_W, INPort_R, UpdatePC;
 	wire T0;
  
   wire [31:0] PCupdate_pattern = {3'b0, ~Zflag, Zflag, 9'b0, ~Cflag, Cflag, ~Zflag, Zflag, 1'b1, 13'b0};
  
  TimingGen inst1(clk, Reset, T0, T1, T2, T3, T4);

  Mux32to1_1bitE inst2(PCupdate_pattern, Opcode, T4, UpdatePC);
  
  Mux32to1_1bitE MUX_SRAM_W (32'h00801000, Opcode, T3, SRAM_W);
  
  Mux32to1_1bitE MUX_SRAM_R (32'h00400800, Opcode, T3, SRAM_R);
  
  Mux32to1_1bitE MUX_Reg_R (32'h07e413fe, Opcode, T1, Reg_R);

  Mux32to1_1bitE MUX_Reg_W (32'h07580ffe, Opcode, T4, Reg_W);

  Mux32to1_1bitE MUX_ALU_Save (32'h1fa417fe, Opcode, T2, ALU_Save);
  
  Mux32to1_1bitE MUX_Z_Save (32'h070001fe, Opcode, T2, Z_Save);
    
  Mux32to1_1bitE MUX_C_Save (32'h07000110, Opcode, T2, C_Save);
    
  Mux32to1_1bitE MUX_Stack_W (32'h00040000, Opcode, T3, Stack_W);
  
  Mux32to1_1bitE MUX_Stack_R (32'h00080000, Opcode, T3, Stack_R);
   
  Mux32to1_1bitE MUX_OUTPort_W (32'h00200000, Opcode, T3, OUTPort_W);
    
  Mux32to1_1bitE MUX_INPort_R (32'h00100000, Opcode, T3, INPort_R);
  
endmodule

/////////////////////////////////////////

module Mux32to1_1bitE(
    input [31:0] in,      
    input [4:0] sel,      
  	input E,              
    output reg out            
);

    always @(*) begin
        if (E) begin  
            case (sel)
                5'b00000: out = in[0];
                5'b00001: out = in[1];
                5'b00010: out = in[2];
                5'b00011: out = in[3];
                5'b00100: out = in[4];
                5'b00101: out = in[5];
                5'b00110: out = in[6];
                5'b00111: out = in[7];
                5'b01000: out = in[8];
                5'b01001: out = in[9];
                5'b01010: out = in[10];
                5'b01011: out = in[11];
                5'b01100: out = in[12];
                5'b01101: out = in[13];
                5'b01110: out = in[14];
                5'b01111: out = in[15];
                5'b10000: out = in[16];
                5'b10001: out = in[17];
                5'b10010: out = in[18];
                5'b10011: out = in[19];
                5'b10100: out = in[20];
                5'b10101: out = in[21];
                5'b10110: out = in[22];
                5'b10111: out = in[23];
                5'b11000: out = in[24];
                5'b11001: out = in[25];
                5'b11010: out = in[26];
                5'b11011: out = in[27];
                5'b11100: out = in[28];
                5'b11101: out = in[29];
                5'b11110: out = in[30];
                5'b11111: out = in[31];
                default: out = 1'b0;  
            endcase
        end
        else begin
            out = 1'b0;  
        end
    end
endmodule
