# TACT Compilation Report
Contract: JettonDefaultWallet
BOC Size: 1261 bytes

# Types
Total Types: 14

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

## TokenTransfer
TLB: `token_transfer#0f8a7ea5 queryId:uint64 amount:coins destination:address responseDestination:Maybe address customPayload:Maybe ^cell forwardTonAmount:coins forwardPayload:remainder<slice> = TokenTransfer`
Signature: `TokenTransfer{queryId:uint64,amount:coins,destination:address,responseDestination:Maybe address,customPayload:Maybe ^cell,forwardTonAmount:coins,forwardPayload:remainder<slice>}`

## TokenTransferInternal
TLB: `token_transfer_internal#178d4519 queryId:uint64 amount:coins from:address responseAddress:Maybe address forwardTonAmount:coins forwardPayload:remainder<slice> = TokenTransferInternal`
Signature: `TokenTransferInternal{queryId:uint64,amount:coins,from:address,responseAddress:Maybe address,forwardTonAmount:coins,forwardPayload:remainder<slice>}`

## TokenNotification
TLB: `token_notification#7362d09c queryId:uint64 amount:coins from:address forwardPayload:remainder<slice> = TokenNotification`
Signature: `TokenNotification{queryId:uint64,amount:coins,from:address,forwardPayload:remainder<slice>}`

## TokenBurn
TLB: `token_burn#595f07bc queryId:uint64 amount:coins owner:address responseAddress:Maybe address = TokenBurn`
Signature: `TokenBurn{queryId:uint64,amount:coins,owner:address,responseAddress:Maybe address}`

## TokenBurnNotification
TLB: `token_burn_notification#7bdd97de queryId:uint64 amount:coins owner:address responseAddress:Maybe address = TokenBurnNotification`
Signature: `TokenBurnNotification{queryId:uint64,amount:coins,owner:address,responseAddress:Maybe address}`

## TokenExcesses
TLB: `token_excesses#d53276db queryId:uint64 = TokenExcesses`
Signature: `TokenExcesses{queryId:uint64}`

## TokenUpdateContent
TLB: `token_update_content#0c087a9e content:Maybe ^cell = TokenUpdateContent`
Signature: `TokenUpdateContent{content:Maybe ^cell}`

## JettonData
TLB: `_ totalSupply:int257 mintable:bool owner:address content:Maybe ^cell walletCode:^cell = JettonData`
Signature: `JettonData{totalSupply:int257,mintable:bool,owner:address,content:Maybe ^cell,walletCode:^cell}`

## JettonWalletData
TLB: `_ balance:int257 owner:address master:address walletCode:^cell = JettonWalletData`
Signature: `JettonWalletData{balance:int257,owner:address,master:address,walletCode:^cell}`

## Mint
TLB: `mint#01fb345b amount:int257 = Mint`
Signature: `Mint{amount:int257}`

# Get Methods
Total Get Methods: 1

## get_wallet_data

# Error Codes
2: Stack undeflow
3: Stack overflow
4: Integer overflow
5: Integer out of expected range
6: Invalid opcode
7: Type check error
8: Cell overflow
9: Cell underflow
10: Dictionary error
13: Out of gas error
32: Method ID not found
34: Action is invalid or not supported
37: Not enough TON
38: Not enough extra-currencies
128: Null reference exception
129: Invalid serialization prefix
130: Invalid incoming message
131: Constraints error
132: Access denied
133: Contract stopped
134: Invalid argument
135: Code of a contract was not found
136: Invalid address
4429: Invalid sender
13650: Invalid bounced message
16059: Invalid value
62972: Invalid balance