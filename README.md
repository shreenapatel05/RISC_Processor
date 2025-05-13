# RISC_Processor
This project implements a five-cycle non-pipelined RISC processor using Verilog HDL. The processor executes each instruction in five sequential stages: Fetch, Decode, Execute, Memory, and Write Back, without overlapping operations.

# The Processor.v file have the following module:
## Module: `RISCprocessor`

### Inputs
- `clk`
- `Reset`
- `[7:0] InpExtWorld1`
- `[7:0] InpExtWorld2`
- `[7:0] InpExtWorld3`
- `[7:0] InpExtWorld4`

### Outputs
- `[7:0] OutExtWorld1`
- `[7:0] OutExtWorld2`
- `[7:0] OutExtWorld3`
- `[7:0] OutExtWorld4`

### Comments
- Pure Structural Coding
- The following modules are instantiated within this module:
- RegisterFile
- InstMEM
- SRAM
- Stack
- ALU
- TimingGen
- ProgCounter
- INport
- OUTport
- ControlLogic
- some MUX32to1_8bit

# The design.sv file will have all the subcomponents of the processor and the following modules:
### Module: `eightbitRegwithLoad`
- **Type:** Behavioral
- **Inputs:** `clk`, `Reset`, `load`, `[7:0] Datain`
- **Outputs:** `[7:0] Dataout`

### Module: `RegisterFile`
- **Type:** Structural 
- **Inputs:** 
  - `clk`, `Reset`
  - `RegFileRead`, `RegFileWrite`
  - `[7:0] Datain`
  - `[3:0] Source1`, `[3:0] Source2`, `[3:0] Destin`
- **Outputs:** 
  - `[7:0] Dataout1`, `[7:0] Dataout2`
- **Internal Instances:**
  - 16 × eightbitRegwithLoad
  - 1 × Decoder4to16_withE
  - 2 × MUX16to1_8bit
  - 2 × eightbitRegwithLoad

### Module: `InstMEM`
- **Type:** Behavioral
- **Inputs:** `clk`, `Reset`
- **Outputs:** `[24:0] Dataout`, `[4:0] Opcode`
- **Memory Declaration:** reg [24:0] instmemory [0:255]

### Module: `SRAM`
- **Style:** Behavioral
- **Inputs:**
  - `clk`
  - `Reset`
  - `[7:0] Address`
  - `SRAMRead`
  - `SRAMWrite`
  - `[7:0] Datain`
- **Output:** `[7:0] Dataout`
- **Memory Declaration:** reg [7:0] datamem [0:255]

### Module: `Stack`
- **Style:** Partial Structural
- **Inputs:**
  - `clk`
  - `Reset`
  - `StackRead`
  - `StackWrite`
  - `[7:0] Datain`
- **Output:** `[7:0] Dataout`
- **Internal Instances:**
  - 1 × `SRAM`
  - 2 × `MUX4to1_8bit`
  - Stack pointer management logic (to handle push/pop operations)

### Module: `ALU`
- **Style:** Structural
- **Inputs:**
  - `clk`
  - `Reset`
  - `Imm7`
  - `[7:0] Operand1`
  - `[7:0] Operand2`
  - `Opcode`
  - `ALUSave`
  - `ZflagSave`
  - `CflagSave`
- **Outputs:**
  - `Zflag`
  - `Cflag`
  - `[7:0] ALUout`
- **Internal Instances:**
  - Some arithmetic logic modules
  - Some `MUX4to1_8bit`

### Module: `TimingGen`
- **Style:** Structural
- **Inputs:**
  - `clk`
  - `Reset`
- **Outputs:**
  - `T0`
  - `T1`
  - `T2`
  - `T3`
  - `T4`
- **Internal Instances:**
  - Some arithmetic logic modules
  - Some Mux and Decoder modules

### Module: `ProgCounter`
- **Style:** Structural
- **Inputs:**
  - `clk`
  - `Reset`
  - `PCenable`
  - `PCupdate`
  - `[7:0] CAddress`
- **Outputs:**
  - `[7:0] PC`
  - `[7:0] PC_D2`
- **Internal Instances:**
  - Some arithmetic logic modules
  - Some mux and D Flipflop

