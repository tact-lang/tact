# TACT Compilation Report
Contract: Wallet
BOC Size: 1061 bytes

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

## Transfer
TLB: `_ seqno:uint32 mode:uint8 to:address amount:coins body:Maybe ^cell = Transfer`
Signature: `Transfer{seqno:uint32,mode:uint8,to:address,amount:coins,body:Maybe ^cell}`

## TransferMessage
TLB: `transfer_message#0000007b signature:^slice transfer:Transfer{seqno:uint32,mode:uint8,to:address,amount:coins,body:Maybe ^cell} = TransferMessage`
Signature: `TransferMessage{signature:^slice,transfer:Transfer{seqno:uint32,mode:uint8,to:address,amount:coins,body:Maybe ^cell}}`

# Get Methods
Total Get Methods: 3

## publicKey

## walletId

## seqno
