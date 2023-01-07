# TACT Compilation Report
Contract: MultisigContract
BOC Size: 678 bytes

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
