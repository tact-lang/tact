# TACT Compilation Report
Contract: SerializationTester2
BOC Size: 813 bytes

# Types
Total Types: 6

## StateInit
TLB: _ code:^cell data:^cell = StateInit

## Context
TLB: _ bounced:bool sender:address value:int257 raw:^slice = Context

## SendParameters
TLB: _ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters

## Vars
TLB: _ a:int257 b:int257 c:int257 d:int257 e:int257 = Vars

## Both
TLB: _ a:Vars b:Vars = Both

## Update
TLB: update#64b3da89 a:Vars b:Vars = Update

# Get Methods
Total Get Methods: 7

## getA

## getAopt

## getB

## getBopt

## getBoth

## getBothOpt

## process
Argument: src
Argument: both
Argument: both2
