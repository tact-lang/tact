# TACT Compilation Report
Contract: Beacon
BOC Size: 561 bytes

# Types
Total Types: 6

## StateInit
TLB: _ code:^cell data:^cell = StateInit

## Context
TLB: _ bounced:bool sender:address value:int257 raw:^slice = Context

## SendParameters
TLB: _ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters

## ChangeOwner
TLB: change_owner#5c7f053d newOwner:address = ChangeOwner

## CanPayout
TLB: can_payout#66be4228 amount:int257 = CanPayout

## CanPayoutResponse
TLB: can_payout_response#01d545f9 amount:int257 address:address ok:bool = CanPayoutResponse

# Get Methods
Total Get Methods: 1

## owner
