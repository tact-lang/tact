# TACT Compilation Report
Contract: MultisigSigner
BOC Size: 753 bytes

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

## Request
TLB: `request#fe519883 requested:address to:address value:coins timeout:uint32 bounce:bool mode:uint8 body:Maybe ^cell = Request`
Signature: `Request{requested:address,to:address,value:coins,timeout:uint32,bounce:bool,mode:uint8,body:Maybe ^cell}`

## Signed
TLB: `signed#83ea5599 request:Request{requested:address,to:address,value:coins,timeout:uint32,bounce:bool,mode:uint8,body:Maybe ^cell} = Signed`
Signature: `Signed{request:Request{requested:address,to:address,value:coins,timeout:uint32,bounce:bool,mode:uint8,body:Maybe ^cell}}`

# Get Methods
Total Get Methods: 1

## request
