# TACT Compilation Report
Contract: SampleContract
BOC Size: 1424 bytes

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

## EntryFirst
TLB: `entry_first#a45b74a8 amountToAdd:uint32 toAddress:address = EntryFirst`
Signature: `EntryFirst{amountToAdd:uint32,toAddress:address}`

## EntrySecond
TLB: `entry_second#ff40dc10 amountToAdd:uint32 toAddress:address = EntrySecond`
Signature: `EntrySecond{amountToAdd:uint32,toAddress:address}`

## First
TLB: `first#bec08f38 amount:uint32 myCoins:coins myBool3:bool anAddress:address = First`
Signature: `First{amount:uint32,myCoins:coins,myBool3:bool,anAddress:address}`

## Second
TLB: `second#17571ec8 amount_bigger:uint64 myBool:bool thisDoesNotFit:uint256 myAddress:address myBool2:bool myStruct:MyStruct{amount:int257} myStruct2:MyStruct{amount:int257} = Second`
Signature: `Second{amount_bigger:uint64,myBool:bool,thisDoesNotFit:uint256,myAddress:address,myBool2:bool,myStruct:MyStruct{amount:int257},myStruct2:MyStruct{amount:int257}}`

## Large
TLB: `large#24dd4543 address:address value:coins = Large`
Signature: `Large{address:address,value:coins}`

## SmallBounce
TLB: `small_bounce#c0dee6d6 amount:uint32 myBool3:bool = SmallBounce`
Signature: `SmallBounce{amount:uint32,myBool3:bool}`

## MyStruct
TLB: `_ amount:int257 = MyStruct`
Signature: `MyStruct{amount:int257}`

# Get Methods
Total Get Methods: 1

## amount

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