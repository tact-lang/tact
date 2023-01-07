# TACT Compilation Report
Contract: MultisigSigner
BOC Size: 756 bytes

# Types
Total Types: 5

## StateInit
TLB: _ code:^cell data:^cell = StateInit

## Context
TLB: _ bounced:bool sender:address value:int257 raw:^slice = Context

## SendParameters
TLB: _ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters

## Request
TLB: request#b84635d1 requested:address to:address value:coins timeout:uint32 bounce:bool mode:uint8 body:Maybe ^cell = Request

## Signed
TLB: signed#d98d22f6 request:Request = Signed

# Get Methods
Total Get Methods: 1

## request
