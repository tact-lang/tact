# TACT Compilation Report
Contract: Wallet
BOC Size: 294 bytes

# Types
Total Types: 4

## StateInit
TLB: _ code:^cell data:^cell = StateInit

## Context
TLB: _ bounced:bool sender:address value:int257 raw:^slice = Context

## SendParameters
TLB: _ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters

## TransferMessage
TLB: transfer_message#87ace8a0 signature:fixed_bytes64 transfer:remainder<slice> = TransferMessage

# Get Methods
Total Get Methods: 3

## publicKey

## walletId

## seqno
