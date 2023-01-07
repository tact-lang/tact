# TACT Compilation Report
Contract: SampleJetton
BOC Size: 1217 bytes

# Types
Total Types: 14

## StateInit
TLB: _ code:^cell data:^cell = StateInit

## Context
TLB: _ bounced:bool sender:address value:int257 raw:^slice = Context

## SendParameters
TLB: _ bounce:bool to:address value:int257 mode:int257 body:Maybe ^cell code:Maybe ^cell data:Maybe ^cell = SendParameters

## ChangeOwner
TLB: change_owner#5c7f053d newOwner:address = ChangeOwner

## TokenTransfer
TLB: token_transfer#0f8a7ea5 queryId:uint64 amount:coins destination:address responseDestination:Maybe address customPayload:Maybe ^cell forwardTonAmount:coins forwardPayload:remainder<slice> = TokenTransfer

## TokenTransferInternal
TLB: token_transfer_internal#178d4519 queryId:uint64 amount:coins from:address responseAddress:Maybe address forwardTonAmount:coins forwardPayload:remainder<slice> = TokenTransferInternal

## TokenNotification
TLB: token_notification#7362d09c queryId:uint64 amount:coins from:address forwardPayload:remainder<slice> = TokenNotification

## TokenBurn
TLB: token_burn#595f07bc queryId:uint64 amount:coins owner:address responseAddress:Maybe address = TokenBurn

## TokenBurnNotification
TLB: token_burn_notification#7bdd97de queryId:uint64 amount:coins owner:address responseAddress:Maybe address = TokenBurnNotification

## TokenExcesses
TLB: token_excesses#d53276db queryId:uint64 = TokenExcesses

## TokenUpdateContent
TLB: token_update_content#9d55c471 content:Maybe ^cell = TokenUpdateContent

## JettonData
TLB: _ totalSupply:int257 mintable:bool owner:address content:Maybe ^cell walletCode:^cell = JettonData

## JettonWalletData
TLB: _ balance:int257 owner:address master:address walletCode:^cell = JettonWalletData

## Mint
TLB: mint#95c2e082 amount:int257 = Mint

# Get Methods
Total Get Methods: 3

## get_wallet_address
Argument: owner

## get_jetton_data

## owner
