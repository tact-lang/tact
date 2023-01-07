# TACT Compilation Report
Contract: MapTestContract
BOC Size: 1738 bytes

# Types
Total Types: 12

## StateInit
TLB: _ code:^cell data:^cell = StateInit

## Context
TLB: _ bounced:bool sender:address value:int257 raw:^slice = Context

## SendParameters
TLB: _ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters

## SetIntMap1
TLB: set_int_map1#564436ac key:int257 value:Maybe int257 = SetIntMap1

## SetIntMap2
TLB: set_int_map2#e70b3fea key:int257 value:Maybe bool = SetIntMap2

## SetIntMap3
TLB: set_int_map3#10c8d8cf key:int257 value:Maybe ^cell = SetIntMap3

## SetIntMap4
TLB: set_int_map4#6d47d509 key:int257 value:Maybe SomeStruct = SetIntMap4

## SetAddrMap1
TLB: set_addr_map1#87431e74 key:address value:Maybe int257 = SetAddrMap1

## SetAddrMap2
TLB: set_addr_map2#42430e1b key:address value:Maybe bool = SetAddrMap2

## SetAddrMap3
TLB: set_addr_map3#77308430 key:address value:Maybe ^cell = SetAddrMap3

## SetAddrMap4
TLB: set_addr_map4#7fa5a2e1 key:address value:Maybe SomeStruct = SetAddrMap4

## SomeStruct
TLB: _ value:int257 = SomeStruct

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
