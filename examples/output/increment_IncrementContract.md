# TACT Compilation Report
Contract: IncrementContract
BOC Size: 1158 bytes

# Types
Total Types: 10

## StateInit
TLB: `_ code:^cell data:^cell = StateInit`
Signature: `StateInit{code:^cell,data:^cell}`

## Context
TLB: `_ bounced:bool sender:address value:int257 raw:^slice = Context`
Signature: `Context{bounced:bool,sender:address,value:int257,raw:^slice}`

## SendParameters
TLB: `_ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters`
Signature: `SendParameters{bounce:bool,to:address,value:int257,mode:int257,body:Maybe ^cell,code:Maybe ^cell,data:Maybe ^cell}`

## Deploy
TLB: `deploy#946a98b6 queryId:uint64 = Deploy`
Signature: `Deploy{queryId:uint64}`

## DeployOk
TLB: `deploy_ok#aff90f57 queryId:uint64 = DeployOk`
Signature: `DeployOk{queryId:uint64}`

## Increment
TLB: `increment#20064f3b key:int257 value:int257 = Increment`
Signature: `Increment{key:int257,value:int257}`

## Toggle
TLB: `toggle#4077d4c8 key:int257 = Toggle`
Signature: `Toggle{key:int257}`

## Persist
TLB: `persist#e29d0faa key:int257 content:Maybe ^cell = Persist`
Signature: `Persist{key:int257,content:Maybe ^cell}`

## Reset
TLB: `reset#6668efb2 key:int257 = Reset`
Signature: `Reset{key:int257}`

## Something
TLB: `_ value:int257 = Something`
Signature: `Something{value:int257}`

# Get Methods
Total Get Methods: 2

## counters

## counters2

# Error Codes
2: Stack undeflow
3: Stack overflow
4: Integer overflow
5: Integer out of expected range
6: Invalid opcode
7: Type check error
8: Cell overflow
9: Cell underflow
10: Dictionary error
13: Out of gas error
32: Method ID not found
34: Action is invalid or not supported
37: Not enough TON
38: Not enough extra-currencies
128: Null reference exception
129: Invalid serialization prefix
130: Invalid incoming message
131: Constraints error
132: Access denied
133: Contract stopped
134: Invalid argument
135: Code of a contract was not found
136: Invalid address
137: Masterchain support is not enabled for this contract
52777: Empty counter