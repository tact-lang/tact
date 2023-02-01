# TACT Compilation Report
Contract: Wallet
BOC Size: 313 bytes

# Types
Total Types: 4

## StateInit
TLB: `_ code:^cell data:^cell = StateInit`
Signature: `StateInit{code:^cell,data:^cell}`

## Context
TLB: `_ bounced:bool sender:address value:int257 raw:^slice = Context`
Signature: `Context{bounced:bool,sender:address,value:int257,raw:^slice}`

## SendParameters
TLB: `_ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters`
Signature: `SendParameters{bounce:bool,to:address,value:int257,mode:int257,body:Maybe ^cell,code:Maybe ^cell,data:Maybe ^cell}`

## TransferMessage
TLB: `transfer_message#d3817806 signature:fixed_bytes64 transfer:remainder<slice> = TransferMessage`
Signature: `TransferMessage{signature:fixed_bytes64,transfer:remainder<slice>}`

# Get Methods
Total Get Methods: 3

## publicKey

## walletId

## seqno
