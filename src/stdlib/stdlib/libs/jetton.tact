/// Struct that describes the data that is returned by the Jetton Minter getter function `get_jetton_data`, defined in TEP-74.
///
/// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#get-methods-1
struct JettonMinterData {
    totalSupply: Int as coins;
    mintable: Bool;
    owner: Address;
    content: Cell;
    jettonWalletCode: Cell;
}

/// Struct that describes the data that is returned by the Jetton Wallet getter function `get_wallet_data`, defined in TEP-74.
///
/// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#get-methods
struct JettonWalletData {
    balance: Int as coins;
    owner: Address;
    minter: Address;
    code: Cell;
}

/// Message, defined in TEP-74, that is sent to the Jetton Wallet contract to transfer jettons to another account.
///
/// #### TLB
///
/// ```tlb
/// transfer#0f8a7ea5 query_id:uint64 amount:(VarUInteger 16) destination:MsgAddress
///     response_destination:MsgAddress custom_payload:(Maybe ^Cell)
///     forward_ton_amount:(VarUInteger 16) forward_payload:(Either Cell ^Cell)
///     = InternalMsgBody;
/// ```
///
/// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#1-transfer
message(0xf8a7ea5) JettonTransfer {
    /// Arbitrary request number.
    queryId: Int as uint64;
    /// Amount of transferred jettons in elementary units.
    amount: Int as coins;
    /// Address of the new owner of the jettons.
    destination: Address;
    /// Address where to send a response with confirmation of a successful transfer and the rest of the incoming message Toncoins.
    responseDestination: Address?;
    /// Optional custom data that could be used by either the sender or the receiver jetton wallets.
    customPayload: Cell?;
    /// The amount of nanotons to be sent to the destination address.
    forwardTonAmount: Int as coins;
    /// Optional custom data that should be sent to the destination address.
    forwardPayload: Slice as remaining;
}

/// Message, defined in TEP-74, that is sent by the `sender` Jetton Wallet contract to the `destination` Jetton Wallet to process the transfer of jettons.
///
/// #### TLB
///
/// ```tlb
/// internal_transfer#178d4519 query_id:uint64 amount:(VarUInteger 16) from:MsgAddress
///     response_address:MsgAddress forward_ton_amount:(VarUInteger 16)
///     forward_payload:(Either Cell ^Cell)
///     = InternalMsgBody;
/// ```
///
/// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#tl-b-schema
message(0x178d4519) JettonTransferInternal {
    /// Arbitrary request number.
    queryId: Int as uint64;
    /// Amount of transferred jettons in elementary units.
    amount: Int as coins;
    /// Address of the previous owner of the transferred jettons.
    sender: Address;
    /// Address where to send a response with confirmation of a successful transfer and the rest of the incoming message Toncoins.
    responseDestination: Address?;
    /// The amount of nanotons to be sent to the destination address.
    forwardTonAmount: Int as coins;
    /// Optional custom data that should be sent to the destination address.
    forwardPayload: Slice as remaining;
}

/// Message, defined in TEP-74, that is sent by the `receiver` Jetton Wallet contract to the `receiver` address to notify about the transfer of jettons.
///
/// #### TLB
///
/// ```tlb
/// transfer_notification#7362d09c query_id:uint64 amount:(VarUInteger 16)
///     sender:MsgAddress forward_payload:(Either Cell ^Cell)
///     = InternalMsgBody;
/// ```
///
/// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#1-transfer
message(0x7362d09c) JettonTransferNotification {
    /// Arbitrary request number.
    queryId: Int as uint64;
    /// Amount of transferred jettons in elementary units.
    amount: Int as coins;
    /// Address of the previous owner of the transferred jettons.
    sender: Address;
    /// Optional custom data that was attached by the `sender`.
    forwardPayload: Slice as remaining;
}

/// Message, defined in TEP-74, that is sent to the Jetton Wallet contract by its owner to decrease its balance by the `amount` of jettons.
///
/// #### TLB
///
/// ```tlb
/// burn#595f07bc query_id:uint64 amount:(VarUInteger 16)
///     response_destination:MsgAddress custom_payload:(Maybe ^Cell)
///     = InternalMsgBody;
/// ```
///
/// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#2-burn
message(0x595f07bc) JettonBurn {
    /// Arbitrary request number.
    queryId: Int as uint64;
    /// Amount of burned jettons.
    amount: Int as coins;
    // Address where to send a response with confirmation of a successful burn and the rest of the incoming message coins.
    responseDestination: Address?;
    // Optional custom data.
    customPayload: Cell?;
}

/// Message, defined in TEP-74, that is sent by the Jetton Wallet contract to the Jetton Minter to notify about the burn of jettons.
///
/// #### TLB
///
/// ```tlb
/// burn_notification#7bdd97de query_id:uint64 amount:(VarUInteger 16)
///     sender:MsgAddress response_destination:MsgAddress
///     = InternalMsgBody;
/// ```
///
/// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#tl-b-schema
message(0x7bdd97de) JettonBurnNotification {
    /// Arbitrary request number.
    queryId: Int as uint64;
    /// Amount of burned jettons.
    amount: Int as coins;
    /// Address of the previous owner of the burned jettons.
    sender: Address;
    /// Address where to send a response with confirmation of a successful burn and the rest of the incoming message coins.
    responseDestination: Address?;
}

/// Message, defined in TEP-74, that is sent by the `receiver` Jetton Wallet contract to the `responseDestination` address to cashback the remaining message coins.
///
/// #### TLB
///
/// ```tlb
/// excesses#d53276db query_id:uint64 = InternalMsgBody
/// ```
///
/// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#1-transfer
message(0xd53276db) JettonExcesses {
    /// Arbitrary request number.
    queryId: Int as uint64;
}

/// Message, defined in TEP-89, that is sent to the Jetton Minter contract to request the Jetton Wallet address for the `ownerAddress`.
///
/// #### TLB
///
/// ```tlb
/// provide_wallet_address#2c76b973 query_id:uint64 
///     owner_address:MsgAddress include_address:Bool 
///     = InternalMsgBody;
/// ```
///
/// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0089-jetton-wallet-discovery.md#scheme
message(0x2c76b973) ProvideWalletAddress {
    /// Arbitrary request number.
    queryId: Int as uint64;
    /// Address of the owner of the requested Jetton Wallet address.
    ownerAddress: Address;
    /// Flag that indicates whether the `ownerAddress` should be included in the response.
    includeAddress: Bool;
}

/// Message, defined in TEP-89, that is sent by the Jetton Minter contract in response to the request about the Jetton Wallet address for the `ownerAddress`.
///
/// #### TLB
///
/// ```tlb
/// take_wallet_address#d1735400 query_id:uint64 
///     wallet_address:MsgAddress owner_address:(Maybe ^MsgAddress)
///     = InternalMsgBody;
/// ```
///
/// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0089-jetton-wallet-discovery.md#scheme
message(0xd1735400) TakeWalletAddress {
    /// Arbitrary request number.
    queryId: Int as uint64;
    /// Address of the requested Jetton Wallet.
    walletAddress: Address;
    /// Address of the owner of the requested Jetton Wallet address.
    ownerAddress: Cell?;
}

// implementation details
message(4) JettonUpdateContent {
    queryId: Int as uint64;
    content: Cell;
}

message(21) Mint {
    queryId: Int as uint64;
    receiver: Address;
    tonAmount: Int as coins;
    mintMessage: JettonTransferInternal;
}

message(22) CloseMinting {}

message(3) ChangeOwner {
    queryId: Int as uint64;
    newOwner: Address;
}
