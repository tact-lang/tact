# TACT Compilation Report
Contract: Functions
BOC Size: 250 bytes

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

## Add
TLB: `add#3194e434 value:int257 = Add`
Signature: `Add{value:int257}`

## Sub
TLB: `sub#9d605aeb value:int257 = Sub`
Signature: `Sub{value:int257}`

# Get Methods
Total Get Methods: 0
