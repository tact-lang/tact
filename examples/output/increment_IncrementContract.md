# TACT Compilation Report
Contract: IncrementContract
BOC Size: 1146 bytes

# Types
Total Types: 10

## StateInit
TLB: _ code:^cell data:^cell = StateInit

## Context
TLB: _ bounced:bool sender:address value:int257 raw:^slice = Context

## SendParameters
TLB: _ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters

## Deploy
TLB: deploy#9ecd7e7f queryId:uint64 = Deploy

## DeployOk
TLB: deploy_ok#e2f76d87 queryId:uint64 = DeployOk

## Increment
TLB: increment#847b5a01 key:int257 value:int257 = Increment

## Toggle
TLB: toggle#8abf04ff key:int257 = Toggle

## Persist
TLB: persist#b74e25ef key:int257 content:Maybe ^cell = Persist

## Reset
TLB: reset#06f8ffac key:int257 = Reset

## Something
TLB: _ value:int257 = Something

# Get Methods
Total Get Methods: 2

## counters

## counters2
