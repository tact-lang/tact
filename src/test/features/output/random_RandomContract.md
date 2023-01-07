# TACT Compilation Report
Contract: RandomContract
BOC Size: 531 bytes

# Types
Total Types: 5

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

# Get Methods
Total Get Methods: 2

## randomInt

## random
Argument: min
Argument: max
