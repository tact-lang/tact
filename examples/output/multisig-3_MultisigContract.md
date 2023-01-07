# TACT Compilation Report
Contract: MultisigContract
BOC Size: 678 bytes

# Types
Total Types: 6

## StateInit
TLB: _ code:^cell data:^cell = StateInit

## Context
TLB: _ bounced:bool sender:address value:int257 raw:^slice = Context

## SendParameters
TLB: _ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters

## Operation
TLB: _ seqno:uint32 amount:coins target:address = Operation

## Execute
TLB: execute#66afa1e6 operation:Operation signature1:^slice signature2:^slice signature3:^slice = Execute

## Executed
TLB: executed#c84fb137 seqno:uint32 = Executed

# Get Methods
Total Get Methods: 4

## key1

## key2

## key3

## seqno
