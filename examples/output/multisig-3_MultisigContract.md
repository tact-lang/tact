# TACT Compilation Report
Contract: MultisigContract
BOC Size: 669 bytes

# Types
Total Types: 6

## StateInit
TLB: `_ code:^cell data:^cell = StateInit`
Signature: `StateInit{code:^cell,data:^cell}`

## Context
TLB: `_ bounced:bool sender:address value:int257 raw:^slice = Context`
Signature: `Context{bounced:bool,sender:address,value:int257,raw:^slice}`

## SendParameters
TLB: `_ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters`
Signature: `SendParameters{bounce:bool,to:address,value:int257,mode:int257,body:Maybe ^cell,code:Maybe ^cell,data:Maybe ^cell}`

## Operation
TLB: `_ seqno:uint32 amount:coins target:address = Operation`
Signature: `Operation{seqno:uint32,amount:coins,target:address}`

## Execute
TLB: `execute#1f0d5570 operation:Operation{seqno:uint32,amount:coins,target:address} signature1:^slice signature2:^slice signature3:^slice = Execute`
Signature: `Execute{operation:Operation{seqno:uint32,amount:coins,target:address},signature1:^slice,signature2:^slice,signature3:^slice}`

## Executed
TLB: `executed#9e12cfb8 seqno:uint32 = Executed`
Signature: `Executed{seqno:uint32}`

# Get Methods
Total Get Methods: 4

## key1

## key2

## key3

## seqno

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
17654: Invalid seqno
48401: Invalid signature