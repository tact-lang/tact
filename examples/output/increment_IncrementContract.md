# TACT Compilation Report
Contract: IncrementContract
BOC Size: 1216 bytes

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

## Deploy
TLB: `deploy#946a98b6 queryId:uint64 = Deploy`
Signature: `Deploy{queryId:uint64}`

## DeployOk
TLB: `deploy_ok#aff90f57 queryId:uint64 = DeployOk`
Signature: `DeployOk{queryId:uint64}`

## Increment
TLB: `increment#20064f3b key:int257 value:int257 = Increment`
Signature: `Increment{key:int257,value:int257}`

## Toggle
TLB: `toggle#4077d4c8 key:int257 = Toggle`
Signature: `Toggle{key:int257}`

## Persist
TLB: `persist#e29d0faa key:int257 content:Maybe ^cell = Persist`
Signature: `Persist{key:int257,content:Maybe ^cell}`

## Reset
TLB: `reset#6668efb2 key:int257 = Reset`
Signature: `Reset{key:int257}`

## Something
TLB: `_ value:int257 = Something`
Signature: `Something{value:int257}`

# Get Methods
Total Get Methods: 2

## counters

## counters2
