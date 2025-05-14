# RISC_Processor
This project implements a five-cycle non-pipelined RISC processor using Verilog HDL. The processor executes each instruction in five sequential stages: Fetch, Decode, Execute, Memory, and Write Back, without overlapping operations.

### How to run the code in EDA playground?
- Login using your account -> main file is already created -> click on add file option in panel where `design.sv` is created , name it `Processor.v` -> repeat the same and name new file as `instructions.mem`(if you don't name the file as same than change the file in Line 623 in design.sv file) -> paste or write the code as given in repository.
- After code is ready, on left most side go to the `Tools & simulations` -> Select `Icarus Verliog 12.0` in drop down menu  -> Select or tick on `open EPWAVE after run` -> Click on RUN on top most bar of the page.
- The title of whole file can be changed from `Share` in the bottom panel -> Write your desired name in orange lined box beside drop down menu. 
- Here, design.sv is the main system design file where each component like ALU, MUX etc is defined, whereas Processor.v contains how the components are interlinked.
- The instruction.mem consists of 25bit instruction set each, which is supposed to be framed according to the desired output.
- The testbench.sv readily verify the functionality of a design through simulations i.e. Waveform.
  
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
- **Type:** Behavioral coding 
- **Inputs:** `clk`, `Reset`, `load`, `[7:0] Datain`
- **Outputs:** `[7:0] Dataout`

### Module: `RegisterFile`
- **Type:** Structural coding 
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
- **Type:** Behavioral coding 
- **Inputs:** `clk`, `Reset`
- **Outputs:** `[24:0] Dataout`, `[4:0] Opcode`
- **Memory Declaration:** reg [24:0] instmemory [0:255]

### Module: `SRAM`
- **Style:** Behavioral coding 
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
- **Style:** Partial Structural coding 
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
- **Style:** Structural coding 
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
- **Style:** Structural coding 
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
- **Style:** Structural coding
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

### Module: `INport`
- **Style:** Structural coding
- **Inputs:**
  - `clk`
  - `Reset`
  - `INportRead`
  - `[7:0] InpExtWorld1`
  - `[7:0] InpExtWorld2`
  - `[7:0] InpExtWorld3`
  - `[7:0] InpExtWorld4`
  - `[7:0] Address`
- **Output:**
  - `[7:0] Dataout`

### Module: `OUTport`
- **Style:** Structural coding
- **Inputs:**
  - `clk`
  - `Reset`
  - `[7:0] Address`
  - `[7:0] Datain`
  - `OUTportWrite`
- **Outputs:**
  - `[7:0] OutExtWorld1`
  - `[7:0] OutExtWorld2`
  - `[7:0] OutExtWorld3`
  - `[7:0] OutExtWorld4`

### Module: `ControlLogic`
- **Style:** Structural coding 
- **Inputs:**
  - `clk`
  - `Reset`
  - `T1`, `T2`, `T3`, `T4`
  - `Zflag`
  - `Cflag`
  - `[4:0] Opcode`
- **Outputs (Control Signals):**
  - `PCupdate`
  - `SRAMRead`, `SRAMWrite`
  - `StackRead`, `StackWrite`
  - `ALUSave`, `ZflagSave`, `CflagSave`
  - `INportRead`, `OUTportWrite`
  - `RegFileRead`, `RegFileWrite`
- **Comments:**
  - Each control signal is implemented using an instance of `MUX32to1_1bit_withE`
  
### Note: The three examples of waveforms is w.r.t three different instructions set given in folder - Example set and their binary fomrat(25bit instruction) in instruction.txt file.



