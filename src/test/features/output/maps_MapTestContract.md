# TACT Compilation Report
Contract: MapTestContract
BOC Size: 2721 bytes

# Types
Total Types: 14

## StateInit
TLB: `_ code:^cell data:^cell = StateInit`
Signature: `StateInit{code:^cell,data:^cell}`

## Context
TLB: `_ bounced:bool sender:address value:int257 raw:^slice = Context`
Signature: `Context{bounced:bool,sender:address,value:int257,raw:^slice}`

## SendParameters
TLB: `_ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters`
Signature: `SendParameters{bounce:bool,to:address,value:int257,mode:int257,body:Maybe ^cell,code:Maybe ^cell,data:Maybe ^cell}`

## SetIntMap1
TLB: `set_int_map1#5a04a318 key:int257 value:Maybe int257 = SetIntMap1`
Signature: `SetIntMap1{key:int257,value:Maybe int257}`

## SetIntMap2
TLB: `set_int_map2#6125cef6 key:int257 value:Maybe bool = SetIntMap2`
Signature: `SetIntMap2{key:int257,value:Maybe bool}`

## SetIntMap3
TLB: `set_int_map3#d7689249 key:int257 value:Maybe ^cell = SetIntMap3`
Signature: `SetIntMap3{key:int257,value:Maybe ^cell}`

## SetIntMap4
TLB: `set_int_map4#16d453c5 key:int257 value:Maybe SomeStruct{value:int257} = SetIntMap4`
Signature: `SetIntMap4{key:int257,value:Maybe SomeStruct{value:int257}}`

## SetIntMap5
TLB: `set_int_map5#0e58f181 key:int257 value:SomeStruct{value:int257} = SetIntMap5`
Signature: `SetIntMap5{key:int257,value:SomeStruct{value:int257}}`

## SetAddrMap1
TLB: `set_addr_map1#684e5e4d key:address value:Maybe int257 = SetAddrMap1`
Signature: `SetAddrMap1{key:address,value:Maybe int257}`

## SetAddrMap2
TLB: `set_addr_map2#2533e390 key:address value:Maybe bool = SetAddrMap2`
Signature: `SetAddrMap2{key:address,value:Maybe bool}`

## SetAddrMap3
TLB: `set_addr_map3#fee42706 key:address value:Maybe ^cell = SetAddrMap3`
Signature: `SetAddrMap3{key:address,value:Maybe ^cell}`

## SetAddrMap4
TLB: `set_addr_map4#645c6979 key:address value:Maybe SomeStruct{value:int257} = SetAddrMap4`
Signature: `SetAddrMap4{key:address,value:Maybe SomeStruct{value:int257}}`

## SetAddrMap5
TLB: `set_addr_map5#50f95ce1 key:address value:SomeStruct{value:int257} = SetAddrMap5`
Signature: `SetAddrMap5{key:address,value:SomeStruct{value:int257}}`

## SomeStruct
TLB: `_ value:int257 = SomeStruct`
Signature: `SomeStruct{value:int257}`

# Get Methods
Total Get Methods: 16

## intMap1

## intMap1Value
Argument: key

## intMap2

## intMap2Value
Argument: key

## intMap3

## intMap3Value
Argument: key

## intMap4

## intMap4Value
Argument: key

## addrMap1

## addrMap1Value
Argument: key

## addrMap2

## addrMap2Value
Argument: key

## addrMap3

## addrMap3Value
Argument: key

## addrMap4

## addrMap4Value
Argument: key
