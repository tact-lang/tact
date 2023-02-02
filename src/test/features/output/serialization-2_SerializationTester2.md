# TACT Compilation Report
Contract: SerializationTester2
BOC Size: 1608 bytes

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

## Vars
TLB: `_ a:int257 b:int257 c:int257 d:int257 e:int257 = Vars`
Signature: `Vars{a:int257,b:int257,c:int257,d:int257,e:int257}`

## Both
TLB: `_ a:Vars{a:int257,b:int257,c:int257,d:int257,e:int257} b:Vars{a:int257,b:int257,c:int257,d:int257,e:int257} = Both`
Signature: `Both{a:Vars{a:int257,b:int257,c:int257,d:int257,e:int257},b:Vars{a:int257,b:int257,c:int257,d:int257,e:int257}}`

## Update
TLB: `update#a2e2bea5 a:Vars{a:int257,b:int257,c:int257,d:int257,e:int257} b:Vars{a:int257,b:int257,c:int257,d:int257,e:int257} = Update`
Signature: `Update{a:Vars{a:int257,b:int257,c:int257,d:int257,e:int257},b:Vars{a:int257,b:int257,c:int257,d:int257,e:int257}}`

# Get Methods
Total Get Methods: 7

## getA

## getAopt

## getB

## getBopt

## getBoth

## getBothOpt

## process
Argument: src
Argument: both
Argument: both2
