# TACT Compilation Report
Contract: MathTester
BOC Size: 2339 bytes

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

## Deploy
TLB: `deploy#946a98b6 queryId:uint64 = Deploy`
Signature: `Deploy{queryId:uint64}`

## DeployOk
TLB: `deploy_ok#aff90f57 queryId:uint64 = DeployOk`
Signature: `DeployOk{queryId:uint64}`

## FactoryDeploy
TLB: `factory_deploy#6d0ff13b queryId:uint64 cashback:address = FactoryDeploy`
Signature: `FactoryDeploy{queryId:uint64,cashback:address}`

# Get Methods
Total Get Methods: 43

## add
Argument: a
Argument: b

## sub
Argument: a
Argument: b

## mul
Argument: a
Argument: b

## div
Argument: a
Argument: b

## mod
Argument: a
Argument: b

## shr
Argument: a
Argument: b

## shl
Argument: a
Argument: b

## and
Argument: a
Argument: b

## or
Argument: a
Argument: b

## compare1
Argument: a
Argument: b

## compare2
Argument: a
Argument: b

## compare3
Argument: a
Argument: b

## compare4
Argument: a
Argument: b

## compare5
Argument: a
Argument: b

## compare6
Argument: a
Argument: b

## compare7
Argument: a
Argument: b

## compare8
Argument: a
Argument: b

## compare9
Argument: a
Argument: b

## compare10
Argument: a
Argument: b

## compare11
Argument: a
Argument: b

## compare12
Argument: a
Argument: b

## compare13
Argument: a
Argument: b

## compare14
Argument: a
Argument: b

## compare15
Argument: a
Argument: b

## compare16
Argument: a
Argument: b

## compare17
Argument: a
Argument: b

## compare18
Argument: a
Argument: b

## compare19
Argument: a
Argument: b

## compare20
Argument: a
Argument: b

## compare21
Argument: a
Argument: b

## compare22
Argument: a
Argument: b

## compare23
Argument: a
Argument: b

## compare24
Argument: a
Argument: b

## compare25
Argument: a
Argument: b

## compare26
Argument: a
Argument: b

## compare27
Argument: a
Argument: b

## compare28
Argument: a
Argument: b

## isNull1
Argument: a

## isNotNull1
Argument: a

## isNull2
Argument: address

## isNotNull2
Argument: address

## isNull3
Argument: cell

## isNotNull3
Argument: cell

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