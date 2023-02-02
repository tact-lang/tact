# TACT Compilation Report
Contract: Beacon
BOC Size: 542 bytes

# Types
Total Types: 6

## StateInit
TLB: `_ code:^cell data:^cell = StateInit`
Signature: `StateInit{code:^cell,data:^cell}`

## Context
TLB: `_ bounced:bool sender:address value:int257 raw:^slice = Context`
Signature: `Context{bounced:bool,sender:address,value:int257,raw:^slice}`

## SendParameters
TLB: `_ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters`
Signature: `SendParameters{bounce:bool,to:address,value:int257,mode:int257,body:Maybe ^cell,code:Maybe ^cell,data:Maybe ^cell}`

## ChangeOwner
TLB: `change_owner#0f474d03 newOwner:address = ChangeOwner`
Signature: `ChangeOwner{newOwner:address}`

## CanPayout
TLB: `can_payout#c41949df amount:int257 = CanPayout`
Signature: `CanPayout{amount:int257}`

## CanPayoutResponse
TLB: `can_payout_response#ffeb40de amount:int257 address:address ok:bool = CanPayoutResponse`
Signature: `CanPayoutResponse{amount:int257,address:address,ok:bool}`

# Get Methods
Total Get Methods: 1

## owner
