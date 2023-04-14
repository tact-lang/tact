# TACT Compilation Report
Contract: Opt3
BOC Size: 352 bytes

# Types
Total Types: 8

## StateInit
TLB: `_ code:^cell data:^cell = StateInit`
Signature: `StateInit{code:^cell,data:^cell}`

## Context
TLB: `_ bounced:bool sender:address value:int257 raw:^slice = Context`
Signature: `Context{bounced:bool,sender:address,value:int257,raw:^slice}`

## SendParameters
TLB: `_ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters`
Signature: `SendParameters{bounce:bool,to:address,value:int257,mode:int257,body:Maybe ^cell,code:Maybe ^cell,data:Maybe ^cell}`

## Struct2
TLB: `struct2#b119629a v:int257 = Struct2`
Signature: `Struct2{v:int257}`

## OptStruct
TLB: `_ s:Maybe Struct2{v:int257} = OptStruct`
Signature: `OptStruct{s:Maybe Struct2{v:int257}}`

## SomeGenericStruct
TLB: `_ value1:int257 value2:int257 value3:int257 value4:int257 value5:int257 = SomeGenericStruct`
Signature: `SomeGenericStruct{value1:int257,value2:int257,value3:int257,value4:int257,value5:int257}`

## StructWithOptionals
TLB: `_ a:Maybe int257 b:Maybe bool c:Maybe ^cell d:Maybe address e:Maybe SomeGenericStruct{value1:int257,value2:int257,value3:int257,value4:int257,value5:int257} = StructWithOptionals`
Signature: `StructWithOptionals{a:Maybe int257,b:Maybe bool,c:Maybe ^cell,d:Maybe address,e:Maybe SomeGenericStruct{value1:int257,value2:int257,value3:int257,value4:int257,value5:int257}}`

## Update
TLB: `update#1554fcfd a:Maybe int257 b:Maybe bool c:Maybe ^cell d:Maybe address e:Maybe SomeGenericStruct{value1:int257,value2:int257,value3:int257,value4:int257,value5:int257} f:Maybe StructWithOptionals{a:Maybe int257,b:Maybe bool,c:Maybe ^cell,d:Maybe address,e:Maybe SomeGenericStruct{value1:int257,value2:int257,value3:int257,value4:int257,value5:int257}} = Update`
Signature: `Update{a:Maybe int257,b:Maybe bool,c:Maybe ^cell,d:Maybe address,e:Maybe SomeGenericStruct{value1:int257,value2:int257,value3:int257,value4:int257,value5:int257},f:Maybe StructWithOptionals{a:Maybe int257,b:Maybe bool,c:Maybe ^cell,d:Maybe address,e:Maybe SomeGenericStruct{value1:int257,value2:int257,value3:int257,value4:int257,value5:int257}}}`

# Get Methods
Total Get Methods: 0

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