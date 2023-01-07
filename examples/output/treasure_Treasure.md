# TACT Compilation Report
Contract: Treasure
BOC Size: 615 bytes

# Types
Total Types: 5

## StateInit
TLB: _ code:^cell data:^cell = StateInit

## Context
TLB: _ bounced:bool sender:address value:int257 raw:^slice = Context

## SendParameters
TLB: _ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters

## ChangeOwner
TLB: change_owner#5c7f053d newOwner:address = ChangeOwner

## Withdraw
TLB: withdraw#0b5b0a04 amount:coins mode:uint8 = Withdraw

# Get Methods
Total Get Methods: 1

## owner
