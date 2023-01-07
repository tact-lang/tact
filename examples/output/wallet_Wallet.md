# TACT Compilation Report
Contract: Wallet
BOC Size: 920 bytes

# Types
Total Types: 5

## StateInit
TLB: _ code:^cell data:^cell = StateInit

## Context
TLB: _ bounced:bool sender:address value:int257 raw:^slice = Context

## SendParameters
TLB: _ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters

## Transfer
TLB: _ seqno:uint32 mode:uint8 to:address amount:coins body:Maybe ^cell = Transfer

## TransferMessage
TLB: transfer_message#0000007b signature:^slice transfer:Transfer = TransferMessage

# Get Methods
Total Get Methods: 3

## publicKey

## walletId

## seqno
