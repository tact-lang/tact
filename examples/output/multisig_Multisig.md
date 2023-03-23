# TACT Compilation Report
Contract: Multisig
BOC Size: 1305 bytes

# Types
Total Types: 5

## StateInit
TLB: `_ code:^cell data:^cell = StateInit`
Signature: `StateInit{code:^cell,data:^cell}`

## Context
TLB: `_ bounced:bool sender:address value:int257 raw:^slice = Context`
Signature: `Context{bounced:bool,sender:address,value:int257,raw:^slice}`

## SendParameters
TLB: `_ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters`
Signature: `SendParameters{bounce:bool,to:address,value:int257,mode:int257,body:Maybe ^cell,code:Maybe ^cell,data:Maybe ^cell}`

## Request
TLB: `request#fe519883 requested:address to:address value:coins timeout:uint32 bounce:bool mode:uint8 body:Maybe ^cell = Request`
Signature: `Request{requested:address,to:address,value:coins,timeout:uint32,bounce:bool,mode:uint8,body:Maybe ^cell}`

## Signed
TLB: `signed#83ea5599 request:Request{requested:address,to:address,value:coins,timeout:uint32,bounce:bool,mode:uint8,body:Maybe ^cell} = Signed`
Signature: `Signed{request:Request{requested:address,to:address,value:coins,timeout:uint32,bounce:bool,mode:uint8,body:Maybe ^cell}}`

# Get Methods
Total Get Methods: 2

## member
Argument: address

## members

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
4429: Invalid sender
4755: Timeout
40810: Completed
46307: Not a member