# TACT Compilation Report
Contract: ContractWithOptionals
BOC Size: 1482 bytes

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
Total Get Methods: 19

## isNotNullA

## isNotNullB

## isNotNullC

## isNotNullD

## isNotNullE

## isNotNullF

## nullA

## nullB

## nullC

## nullD

## nullE

## nullF

## notNullA

## notNullB

## notNullC

## notNullD

## notNullE

## notNullF

## testVariables
