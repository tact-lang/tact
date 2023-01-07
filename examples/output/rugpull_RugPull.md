# TACT Compilation Report
Contract: RugPull
BOC Size: 1242 bytes

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

## RugParams
TLB: _ investment:int257 returns:int257 fee:int257 = RugParams

# Get Methods
Total Get Methods: 3

## params

## owner

## stopped
