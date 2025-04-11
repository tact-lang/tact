/// Struct. Available since Tact 1.6.6.
///
/// Describes the data returned by the Jetton Minter getter function `get_jetton_data()`,
/// which is defined in TEP-74 and should be present in every Jetton Minter implementation.
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonMinter(
///     totalSupply: Int as coins,
///     owner: Address,
///     jettonContent: Cell,
///     mintable: Bool,
/// ) {
///     // ...
///     get fun get_jetton_data(): JettonMinterData {
///         return JettonMinterData {
///             totalSupply: self.totalSupply,
///             mintable: self.mintable,
///             adminAddress: self.owner,
///             jettonContent: self.jettonContent,
///             jettonWalletCode: codeOf JettonWallet,
///         };
///     }
///     // ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettonminterdata
/// * https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#get-methods-1
///
struct JettonMinterData {
    /// Total supply of this Jetton Minter — the amount of tokens.
    totalSupply: Int as coins;

    /// Whether the tokens are still mintable.
    mintable: Bool;

    /// Owner of the Jetton Minter — the regular TON wallet address.
    owner: Address;

    /// Jetton content metadata, such as its name, description, symbol, etc.
    ///
    /// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0064-token-data-standard.md
    ///
    content: Cell;

    /// Code of the child Jetton Wallet contract that Jetton Minter would
    /// deploy for each user's TON wallet.
    jettonWalletCode: Cell;
}

/// Struct. Available since Tact 1.6.6.
///
/// Describes the data returned by the Jetton Wallet getter function `get_wallet_data()`,
/// which is defined in TEP-74 and should be present in every Jetton Wallet implementation.
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonWallet(
///     owner: Address,
///     minter: Address,
///     balance: Int as coins,
/// ) {
///     // ...
///     get fun get_wallet_data(): JettonWalletData {
///         return JettonWalletData {
///             owner: self.owner,
///             minter: self.minter,
///             balance: self.balance,
///             code: myCode(),
///         };
///     }
///     // ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettonwalletdata
/// * https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#get-methods
///
struct JettonWalletData {
    /// Balance of the Jetton Wallet in tokens.
    balance: Int as coins;

    /// Owner of the Jetton Wallet — the regular TON wallet address.
    owner: Address;

    /// Address of the parent Jetton Minter contract.
    minter: Address;

    /// Code of this Jetton Wallet contract.
    code: Cell;
}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body defined in TEP-74: it is sent to one Jetton Wallet
/// contract to initialize a transfer of tokens to another Jetton Wallet.
///
/// NOTE: Always verify the sender of the message before taking any further actions.
///
/// #### TL-B from the TEP-74
///
/// ```tlb
/// transfer#0f8a7ea5
///     query_id:uint64
///     amount:(VarUInteger 16)
///     destination:MsgAddress
///     response_destination:MsgAddress
///     custom_payload:(Maybe ^Cell)
///     forward_ton_amount:(VarUInteger 16)
///     forward_payload:(Either Cell ^Cell)
///     = InternalMsgBody;
/// ```
///
/// #### Usage example
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonWallet(
///     owner: Address,
///     balance: Int as coins,
///     // ...
/// ) {
///     receive(msg: JettonTransfer) {
///         forceBasechain(msg.destination);
///         require(sender() == self.owner, "Incorrect sender");
///
///         self.balance -= msg.amount;
///         require(self.balance >= 0, "Incorrect balance after send");
///
///         // ...further checks and actions...
///     }
///
///     // ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettontransfer
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettontransferinternal
/// * https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#1-transfer
///
message(0xf8a7ea5) JettonTransfer {
    /// Unique identifier used to trace transactions across multiple contracts.
    /// Setting it to 0 means we don't mark messages to trace requests.
    queryId: Int as uint64;

    /// Amount of tokens to be transferred.
    amount: Int as coins;

    /// A new owner of the transferred tokens — the regular TON wallet address.
    destination: Address;

    /// Address where to send a response confirming a successful transfer
    /// and the remaining Toncoin from the incoming message.
    responseDestination: Address?;

    /// Optional custom data received from another Jetton Wallet.
    customPayload: Cell?;

    /// The amount of nanotons to be sent to the `destination` address.
    forwardTonAmount: Int as coins;

    /// Optional custom data to be sent to the `destination` address.
    forwardPayload: Slice as remaining; // (Either Cell ^Cell)
}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body defined in TEP-74: it is sent and received by the
/// Jetton Wallet contract to make a transfer or process an incoming one, respectively.
///
/// NOTE: Always verify the sender of the message before taking any further actions.
///
/// #### TL-B from the TEP-74
///
/// ```tlb
/// internal_transfer#178d4519
///     query_id:uint64
///    a mount:(VarUInteger 16)
///     from:MsgAddress
///     response_address:MsgAddress
///     forward_ton_amount:(VarUInteger 16)
///     forward_payload:(Either Cell ^Cell)
///     = InternalMsgBody;
/// ```
///
/// #### Usage examples
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonWallet(
///     owner: Address,
///     minter: Address,
///     balance: Int as coins,
/// ) {
///     receive(msg: JettonTransfer) {
///         forceBasechain(msg.destination);
///         require(sender() == self.owner, "Incorrect sender");
///
///         // ...other intermediate checks...
///
///         deploy(DeployParameters {
///             value: 0,
///             mode: SendRemainingValue,
///             bounce: true,
///             body: JettonTransferInternal {
///                 queryId: msg.queryId,
///                 amount: msg.amount,
///                 sender: self.owner,
///                 responseDestination: msg.responseDestination,
///                 forwardTonAmount: msg.forwardTonAmount,
///                 forwardPayload: msg.forwardPayload,
///             }.toCell(),
///             init: initOf JettonWallet(0, msg.destination, self.minter),
///         });
///     }
///
///     receive(msg: JettonTransferInternal) {
///         self.balance += msg.amount;
///
///         // This message should come only from master, or from other JettonWallet
///         let wallet: StateInit = initOf JettonWallet(0, msg.sender, self.minter);
///         if (!wallet.hasSameBasechainAddress(sender())) {
///             require(self.minter == sender(), "Incorrect sender");
///         }
///
///         // ...further actions...
///     }
///
///     bounced(msg: bounced<JettonTransferInternal>) {
///         self.balance += msg.amount;
///     }
///
///     // ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettontransferinternal
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettontransfer
/// * https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#tl-b-schema
///
message(0x178d4519) JettonTransferInternal {
    /// Unique identifier used to trace transactions across multiple contracts.
    /// Setting it to 0 means we don't mark messages to trace requests.
    queryId: Int as uint64;

    /// Amount of transferred tokens.
    amount: Int as coins;

    /// Previous owner of the transferred tokens — the regular TON wallet address.
    sender: Address;

    /// Address where to send a response confirming a successful transfer
    /// and the remaining Toncoin from the incoming message.
    responseDestination: Address?;

    /// The amount of nanotons to be sent to the new owner's address.
    forwardTonAmount: Int as coins;

    /// Optional custom data to be sent to the new owner's address.
    forwardPayload: Slice as remaining; // (Either Cell ^Cell)
}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body defined in TEP-74: it is sent from the Jetton Wallet
/// contract to the `self.owner` address to notify about the incoming transfer
/// of tokens from their previous owner — the `sender`.
///
/// #### TL-B from the TEP-74
///
/// ```tlb
/// transfer_notification#7362d09c
///     query_id:uint64
///     amount:(VarUInteger 16)
///     sender:MsgAddress
///     forward_payload:(Either Cell ^Cell)
///     = InternalMsgBody;
/// ```
///
/// #### Usage example
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonWallet(
///     owner: Address,
///     // ...
/// ) {
///     // ...
///     receive(msg: JettonTransferInternal) {
///         // ...prior checks...
///
///         let msgValue: Int = ctx.value;
///         if (msg.forwardTonAmount > 0) {
///             let fwdFee: Int = ctx.readForwardFee();
///             msgValue -= msg.forwardTonAmount + fwdFee;
///             message(MessageParameters {
///                 to: self.owner,
///                 value: msg.forwardTonAmount,
///                 mode: SendPayGasSeparately,
///                 bounce: false,
///                 body: JettonTransferNotification {
///                     queryId: msg.queryId,
///                     amount: msg.amount,
///                     sender: msg.sender,
///                     forwardPayload: msg.forwardPayload,
///                 }.toCell(),
///             });
///         }
///
///         // ...further actions...
///     }
///     // ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettontransfernotification
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettontransferinternal
/// * https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#1-transfer
///
message(0x7362d09c) JettonTransferNotification {
    /// Unique identifier used to trace transactions across multiple contracts.
    /// Setting it to 0 means we don't mark messages to trace requests.
    queryId: Int as uint64;

    /// Amount of transferred tokens.
    amount: Int as coins;

    /// Previous owner of the transferred tokens — the regular TON wallet address.
    sender: Address;

    /// Optional custom data to be sent to the new owner's address.
    forwardPayload: Slice as remaining; // (Either Cell ^Cell)
}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body defined in TEP-74: it is sent to the Jetton Wallet
/// contract from its TON wallet owner to decrease its balance by a certain `amount`.
///
/// NOTE: Always verify the sender of the message before taking any further actions.
///
/// #### TL-B from the TEP-74
///
/// ```tlb
/// burn#595f07bc
///     query_id:uint64
///     amount:(VarUInteger 16)
///     response_destination:MsgAddress
///     custom_payload:(Maybe ^Cell)
///     = InternalMsgBody;
/// ```
///
/// #### Usage example
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonWallet(
///     owner: Address,
///     balance: Int as coins,
///     // ...
/// ) {
///     // ...
///     receive(msg: JettonBurn) {
///         require(sender() == self.owner, "Incorrect sender");
///         self.balance -= msg.amount;
///         require(self.balance >= 0, "Incorrect balance after send");
///         // ...further actions...
///     }
///     // ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettonburn
/// * https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#2-burn
///
message(0x595f07bc) JettonBurn {
    /// Unique identifier used to trace transactions across multiple contracts.
    /// Setting it to 0 means we don't mark messages to trace requests.
    queryId: Int as uint64;

    /// Amount of burned tokens.
    amount: Int as coins;

    /// Address where to send a response confirming a successful burn
    /// and the remaining Toncoin from the incoming message.
    responseDestination: Address?;

    /// Optional custom data received from another Jetton Wallet.
    customPayload: Cell?;
}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body defined in TEP-74: it is sent from the Jetton Wallet
/// contract to the Jetton Minter to notify about the successful burn
/// and reduce the total supply of tokens.
///
/// #### TL-B from the TEP-74
///
/// ```tlb
/// burn_notification#7bdd97de
///     query_id:uint64
///     amount:(VarUInteger 16)
///     sender:MsgAddress
///     response_destination:MsgAddress
///     = InternalMsgBody;
/// ```
///
/// #### Usage examples
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonMinter(
///     // ...
/// ) {
///     // ...
///     receive(msg: JettonBurnNotification) {
///         let sender = parseStdAddress(sender().asSlice());
///         let wallet = getJettonBasechainWalletByOwner(msg.sender);
///
///         require(
///             sender.workchain == 0 && sender.address == wallet.hash!!,
///             "Unauthorized burn",
///         );
///         // ...further actions...
///     }
///     // ...
/// }
///
/// contract JettonWallet(
///     balance: Int as coins,
///     // ...
/// ) {
///     // ...
///     bounced(msg: bounced<JettonBurnNotification>) {
///         self.balance += msg.amount;
///     }
///     // ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettonburnnotification
/// * https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#tl-b-schema
///
message(0x7bdd97de) JettonBurnNotification {
    /// Unique identifier used to trace transactions across multiple contracts.
    /// Setting it to 0 means we don't mark messages to trace requests.
    queryId: Int as uint64;

    /// Amount of burned tokens.
    amount: Int as coins;

    /// Previous owner of the burned tokens — the regular TON wallet address.
    sender: Address;

    /// Address where to send a response confirming a successful burn
    /// and the remaining Toncoin from the incoming message.
    responseDestination: Address?;
}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body defined in TEP-74: it is sent from either Jetton Minter
/// or Jetton Wallet to refund the remaining Toncoin from the incoming message.
///
/// #### TL-B from the TEP-74
///
/// ```tlb
/// excesses#d53276db
///     query_id:uint64
///     = InternalMsgBody;
/// ```
///
/// #### Usage example
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonMinter(
///     // ...
/// ) {
///     // ...
///     receive(msg: JettonBurnNotification) {
///         // ...
///         if (msg.responseDestination != null) {
///             message(MessageParameters {
///                 to: msg.responseDestination!!,
///                 body: JettonExcesses { queryId: msg.queryId }.toCell(),
///                 value: 0,
///                 bounce: false, // do not bounce
///                 mode: SendRemainingValue | SendIgnoreErrors,
///             });
///         }
///     }
///     // ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettonexcesses
/// * https://github.com/ton-blockchain/TEPs/blob/master/text/0074-jettons-standard.md#1-transfer
///
message(0xd53276db) JettonExcesses {
    /// Unique identifier used to trace transactions across multiple contracts.
    /// Setting it to 0 means we don't mark messages to trace requests.
    queryId: Int as uint64;
}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body defined in TEP-89: it is sent to the Jetton Minter
/// contract to request the Jetton Wallet address for the `ownerAddress`.
///
/// #### TL-B from the TEP-89
///
/// ```tlb
/// provide_wallet_address#2c76b973
///     query_id:uint64
///     owner_address:MsgAddress
///     include_address:Bool
///     = InternalMsgBody;
/// ```
///
/// #### Usage example
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonMinter(
///     // ...
/// ) {
///     // ...
///     receive(msg: ProvideWalletAddress) {
///         let ownerWorkchain = parseStdAddress(msg.ownerAddress.asSlice()).workchain;
///         // ...further actions...
///     }
///     // ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#providewalletaddress
/// * https://github.com/ton-blockchain/TEPs/blob/master/text/0089-jetton-wallet-discovery.md#scheme
///
message(0x2c76b973) ProvideWalletAddress {
    /// Unique identifier used to trace transactions across multiple contracts.
    /// Setting it to 0 means we don't mark messages to trace requests.
    queryId: Int as uint64;

    /// Owner of the requested Jetton Wallet — the regular TON wallet address.
    ownerAddress: Address;

    /// Whether the `ownerAddress` should be included in the response.
    includeAddress: Bool;
}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body defined in TEP-89: it is sent from the Jetton Minter
/// contract in response to a request for the Jetton Wallet address
/// for the `ownerAddress`.
///
/// #### TL-B from the TEP-89
///
/// ```tlb
/// take_wallet_address#d1735400
///     query_id:uint64
///     wallet_address:MsgAddress
///     owner_address:(Maybe ^MsgAddress)
///     = InternalMsgBody;
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#takewalletaddress
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#providewalletaddress
/// * https://github.com/ton-blockchain/TEPs/blob/master/text/0089-jetton-wallet-discovery.md#scheme
///
message(0xd1735400) TakeWalletAddress {
    /// Unique identifier used to trace transactions across multiple contracts.
    /// Setting it to 0 means we don't mark messages to trace requests.
    queryId: Int as uint64;

    /// Address of the requested Jetton Wallet.
    walletAddress: Address;

    /// Owner of the requested Jetton Wallet — the regular TON wallet address.
    ownerAddress: Cell?;
}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body often used in Jetton implementations: it is sent
/// to the Jetton Minter contract to update the Jetton content metadata,
/// which is defined in TEP-64.
///
/// NOTE: Always verify the sender of the message before taking any further actions.
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonMinter(
///     owner: Address,
///     jettonContent: Cell,
///     // ...
/// ) {
///     // ...
///     receive(msg: JettonUpdateContent) {
///         require(sender() == self.owner, "Incorrect sender");
///         self.jettonContent = msg.content;
///     }
///     // ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-jetton-interface#jettonupdatecontent
/// * https://github.com/ton-blockchain/TEPs/blob/master/text/0064-token-data-standard.md
///
message(4) JettonUpdateContent {
    /// Unique identifier used to trace transactions across multiple contracts.
    /// Setting it to 0 means we don't mark messages to trace requests.
    queryId: Int as uint64;

    /// New Jetton content metadata, such as its name, description, symbol, etc.
    ///
    /// See: https://github.com/ton-blockchain/TEPs/blob/master/text/0064-token-data-standard.md
    ///
    newContent: Cell;
}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body often used in Jetton implementations: it is sent
/// to the Jetton Minter contract to mint `mintMessage.amount` of tokens
/// for the `receiver`.
///
/// NOTE: Always verify the sender of the message before taking any further actions.
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonMinter(
///     owner: Address,
///     mintable: Bool,
///     // ...
/// ) {
///     // ...
///     receive(msg: Mint) {
///         require(sender() == self.owner, "Incorrect sender");
///         require(self.mintable, "Mint is closed");
///         // ...further actions...
///     }
///     // ...
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/stdlib-jetton-interface#mint
///
message(21) Mint {
    /// Unique identifier used to trace transactions across multiple contracts.
    /// Setting it to 0 means we don't mark messages to trace requests.
    queryId: Int as uint64;

    /// Recipient of the minted tokens — the regular TON wallet address.
    receiver: Address;

    /// The amount of nanotons to be sent to the `receiver` during the transfer.
    tonAmount: Int as coins;

    /// If the Jetton Wallet for the given `receiver` does not exist, this message
    /// will be used for its deployment and minting. Otherwise, only mints the tokens
    /// for the `receiver` using their corresponding Jetton Wallet.
    mintMessage: JettonTransferInternal;
}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body often used in Jetton implementations: it is sent
/// to the Jetton Minter contract to disable the ability to mint new tokens.
///
/// NOTE: Always verify the sender of the message before taking any further actions.
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonMinter(
///     owner: Address,
///     mintable: Bool,
///     // ...
/// ) {
///     // ...
///     receive(msg: CloseMinting) {
///         require(sender() == self.owner, "Incorrect sender");
///         self.mintable = false;
///         cashback(sender());
///     }
///     // ...
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/stdlib-jetton-interface#closeminting
///
message(22) CloseMinting {}

/// Message struct. Available since Tact 1.6.6.
///
/// Represents a message body often used in Jetton implementations: it is sent
/// to the Jetton Minter contract to change the owner to `newOwner`.
///
/// NOTE: Always verify the sender of the message before taking any further actions.
///
/// ```tact
/// import "@stdlib/jetton-interface";
///
/// contract JettonMinter(
///     owner: Address,
///     // ...
/// ) {
///     // ...
///     receive(msg: ChangeOwner) {
///         require(sender() == self.owner, "Incorrect sender");
///         self.owner = msg.newOwner;
///     }
///     // ...
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/stdlib-jetton-interface#changeowner
///
message(3) ChangeOwner {
    /// Unique identifier used to trace transactions across multiple contracts.
    /// Setting it to 0 means we don't mark messages to trace requests.
    queryId: Int as uint64;

    /// New owner of the contract — the regular TON wallet address.
    newOwner: Address;
}
