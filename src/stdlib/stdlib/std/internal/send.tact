/// Ordinary message (default).
///
/// This constant is available since Tact 1.6.0.
///
/// See: https://docs.tact-lang.org/book/message-mode#base-modes
///
const SendDefaultMode: Int = 0;

/// Carry all the remaining value of the inbound message in addition
/// to the value initially indicated in the new message.
///
/// See: https://docs.tact-lang.org/book/message-mode#base-modes
///
const SendRemainingValue: Int = 64;

/// Carry **all the remaining balance** of the current smart contract instead
/// of the value originally indicated in the message.
///
/// See: https://docs.tact-lang.org/book/message-mode#base-modes
///
const SendRemainingBalance: Int = 128;

/// Doesn't send the message, only estimates the forward fees
/// if the message-sending function computes those.
///
/// This constant is available since Tact 1.5.0.
///
/// See:
/// * https://docs.tact-lang.org/book/message-mode#base-modes
/// * https://docs.tact-lang.org/book/send#message-sending-functions
///
const SendOnlyEstimateFee: Int = 1024;

/// Pay forward fees separately from the message value.
///
/// See: https://docs.tact-lang.org/book/message-mode#optional-flags
///
const SendPayGasSeparately: Int = 1;

/// Ignore any errors arising while processing this message during the action phase.
///
/// See: https://docs.tact-lang.org/book/message-mode#optional-flags
///
const SendIgnoreErrors: Int = 2;

/// Bounce transaction in case of any errors during action phase.
/// Has no effect if flag +2, `SendIgnoreErrors` is used.
///
/// See: https://docs.tact-lang.org/book/message-mode#optional-flags
///
const SendBounceIfActionFail: Int = 16;

/// Current account (contract) will be destroyed if its resulting balance is zero.
/// This flag is often used with mode 128, `SendRemainingBalance`.
///
/// See: https://docs.tact-lang.org/book/message-mode#optional-flags
///
const SendDestroyIfZero: Int = 32;

/// Struct for specifying the message parameters of the `send()` function.
///
/// See: https://docs.tact-lang.org/ref/core-common#send
///
struct SendParameters {
    /// An 8-bit value that configures how to send a message, defaults to 0.
    /// See: https://docs.tact-lang.org/book/message-mode
    mode: Int = SendDefaultMode;

    /// Optional message body as a `Cell`.
    body: Cell? = null;

    /// Optional initial code of the contract (compiled bitcode).
    code: Cell? = null;

    /// Optional initial data of the contract (arguments of `init()` function).
    data: Cell? = null;

    /// The amount of nanoToncoins you want to send with
    /// the message. This value is used to cover forward fees,
    /// unless the optional flag `SendPayGasSeparately` is used.
    value: Int;

    /// Recipient internal `Address` on TON Blockchain.
    to: Address;

    /// When set to `true` (default) message bounces back to the sender if
    /// the recipient contract doesn't exist or wasn't able to process the message.
    bounce: Bool = true;
}

/// Struct for specifying the message parameters of the `message()` function. Available since Tact 1.6.0.
///
/// See: https://docs.tact-lang.org/ref/core-common#message
///
struct MessageParameters {
    /// An 8-bit value that configures how to send a message, defaults to 0.
    /// See: https://docs.tact-lang.org/book/message-mode
    mode: Int = SendDefaultMode;

    /// Optional message body as a `Cell`.
    body: Cell? = null;

    /// The amount of nanoToncoins you want to send with
    /// the message. This value is used to cover forward fees,
    /// unless the optional flag `SendPayGasSeparately` is used.
    value: Int;

    /// Recipient internal `Address` on TON Blockchain.
    to: Address;

    /// When set to `true` (default) message bounces back to the sender if
    /// the recipient contract doesn't exist or wasn't able to process the message.
    bounce: Bool = true;
}

/// Global function. Available since Tact 1.6.0.
///
/// Queues the message to be sent using the `MessageParameters` struct. Allows for cheaper non-deployment, regular messages compared to the `send()` function.
///
/// The `MessageParameters` struct is similar to `SendParameters` struct, but without the `body` and `code` fields.
///
/// Attempts to queue more than 255 messages throw an exception with an exit code 33: `Action list is too long`.
///
/// ```tact
/// fun example() {
///     message(MessageParameters{
///         to: sender(),    // back to the sender,
///         value: ton("1"), // with 1 Toncoin (1_000_000_000 nanoToncoin),
///                          // and no message body
///     });
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-common#message
/// * https://docs.tact-lang.org/book/message-mode
///
asm fun message(params: MessageParameters) {
    NEWC
    b{01} STSLICECONST  // store tag = $0 and ihr_disabled = true
    1 STI               // store `bounce`
    b{000} STSLICECONST // store bounced = false and src = addr_none
    STSLICE             // store `to`
    SWAP
    STGRAMS             // store `value`
    106 PUSHINT         // 1 + 4 + 4 + 64 + 32 + 1
    STZEROES
    // → Stack state
    // s0: Builder
    // s1: `data`
    // s2: `code`
    // s3: `body`
    // s4: `mode`
    STDICT
    ENDC
    SWAP
    SENDRAWMSG
}

/// Global function. Queues the message to be sent using a `SendParameters` Struct.
///
/// Attempts to queue more than 255 messages throw an exception with an exit code 33: `Action list is too long`.
///
/// ```tact
/// fun example() {
///     send(SendParameters{
///         to: sender(),    // back to the sender,
///         value: ton("1"), // with 1 Toncoin (1_000_000_000 nanoToncoin),
///                          // and no message body
///     });
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-common#send
///
asm fun send(params: SendParameters) {
    // Instructions are grouped, and the stack states they produce as a group are shown right after.
    // In the end, our message Cell should have the following TL-B structure:
    // message$_ {X:Type}
    //   info:CommonMsgInfoRelaxed
    //   init:(Maybe (Either StateInit ^StateInit))
    //   body:(Either X ^X)
    // = MessageRelaxed X;

    // → Stack state
    // s0: `params.bounce`
    // s1: `params.to`
    // s2: `params.value`
    // s3: `params.data`
    // s4: `params.code`
    // s5: `params.body`
    // s6: `params.mode`
    // For brevity, the "params" prefix will be omitted from now on.

    // Group 1: Storing the `bounce`, `to` and `value` into a Builder
    NEWC
    b{01} STSLICECONST  // store tag = $0 and ihr_disabled = true
    1 STI               // store `bounce`
    b{000} STSLICECONST // store bounced = false and src = addr_none
    STSLICE             // store `to`
    SWAP
    STGRAMS             // store `value`
    105 PUSHINT         // 1 + 4 + 4 + 64 + 32
    STZEROES            // store currency_collection, ihr_fee, fwd_fee, created_lt and created_at
    // → Stack state
    // s0: Builder
    // s1: `data`
    // s2: `code`
    // s3: `body`
    // s4: `mode`

    // Group 2: Placing the Builder after code and data, then checking those for nullability
    s2 XCHG0
    DUP2
    ISNULL
    SWAP
    ISNULL
    MUL // note that -1 * -1 wraps back to -1
    // → Stack state
    // s0: -1 (true) if `data` and `code` are both null, 0 (false) otherwise
    // s1: `code`
    // s2: `data`
    // s3: Builder
    // s4: `body`
    // s5: `mode`

    // Group 3: Left branch of the IFELSE, executed if s0 is -1 (true)
    <{
        DROP2 // drop `data` and `code`, since either of those is null
        b{0} STSLICECONST
    }> PUSHCONT

    // Group 3: Right branch of the IFELSE, executed if s0 is 0 (false)
    <{
        // _ split_depth:(Maybe (## 5))
        //   special:(Maybe TickTock)
        //   code:(Maybe ^Cell)
        //   data:(Maybe ^Cell)
        //   library:(Maybe ^Cell)
        // = StateInit;
        ROT                // place message Builder on top
        b{10} STSLICECONST // store Maybe = true, Either = false
        // Start composing inlined StateInit
        b{00} STSLICECONST // store split_depth and special first
        STDICT             // store code
        STDICT             // store data
        b{0} STSLICECONST  // store library
    }> PUSHCONT

    // Group 3: IFELSE that does the branching shown above
    IFELSE
    // → Stack state
    // s0: Builder
    // s1: null or StateInit
    // s2: `body`
    // s3: `mode`

    // Group 4: Finalizing the message
    STDICT // store `body` as ref with an extra Maybe bit, since `body` might be null
    ENDC
    // → Stack state
    // s0: Cell
    // s1: `mode`

    // Group 5: Sending the message, with `mode` on top
    SWAP
    SENDRAWMSG // https://github.com/tact-lang/tact/issues/1558
}

/// Struct for specifying the deployment message parameters of the `deploy()` function. Available since Tact 1.6.0.
///
/// See: https://docs.tact-lang.org/ref/core-common#deploy
///
struct DeployParameters {
    /// An 8-bit value that configures how to send a message, defaults to 0.
    /// See: https://docs.tact-lang.org/book/message-mode
    mode: Int = SendDefaultMode;

    /// Optional message body as a `Cell`.
    body: Cell? = null;

    /// The amount of nanoToncoins you want to send with
    /// the message. This value is used to cover forward fees,
    /// unless the optional flag `SendPayGasSeparately` is used.
    value: Int;

    /// When set to `true` (default) message bounces back to the sender if
    /// the recipient contract doesn't exist or wasn't able to process the message.
    bounce: Bool = true;

    /// Initial package of the contract (initial code and initial data).
    /// See: https://docs.tact-lang.org/book/expressions#initof
    init: StateInit;
}

/// Global function. Available since Tact 1.6.0.
///
/// Queues the contract deployment message to be sent using the `DeployParameters` Struct. Allows for cheaper on-chain deployments compared to the `send()` function.
///
/// The `DeployParameters` Struct consists of the following fields:
/// * `mode: Int`, an 8-bit value that configures how to send a message, defaults to 0.
/// * `body: Cell?`, optional message body as a `Cell`.
/// * `value: Int`, the amount of nanoToncoins you want to send with the message.
///   This value is used to cover forward fees, unless the optional flag `SendPayGasSeparately` is used.
/// * `bounce: Bool`, when set to `true` (default) message bounces back to the sender
///    if the recipient contract doesn't exist or wasn't able to process the message.
/// * `init: StateInit`, init package of the contract (initial code and initial data).
///
/// Attempts to queue more than 255 messages throw an exception with an exit code 33: `Action list is too long`.
///
/// ```tact
/// fun example() {
///     deploy(DeployParameters{
///         init: initOf SomeContract(), // with initial code and data of SomeContract
///                                      // and no additional message body
///         mode: SendIgnoreErrors,      // skip the message in case of errors
///         value: ton("1"),             // send 1 Toncoin (1_000_000_000 nanoToncoin)
///     });
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-common#deploy
/// * https://docs.tact-lang.org/book/message-mode
///
asm fun deploy(params: DeployParameters) {
    // Instructions are grouped, and the stack states they produce as a group are shown right after.
    //
    // → Stack state
    // s0: `params.init.data`
    // s1: `params.init.code`
    // s2: `params.bounce`
    // s3: `params.value`
    // s4: `params.body`
    // s5: `params.mode`
    // For brevity, the "params" prefix will be omitted from now on.

    // Group 1: Preparation of needed params
    // For almost identical logic and instructions,
    // see comments inside `contractHash()` function in contract.tact
    4 1 BLKPUSH // pushes 2 copies of `init.code` and `init.data`
    HASHCU // `init.data` hash
    SWAP
    HASHCU // `init.code` hash
    SWAP2
    CDEPTH // `init.data` depth
    SWAP
    CDEPTH // `init.code` depth

    // Group 2: Calculating destination address
    // For almost identical logic and instructions,
    // see comments inside `contractHash()` function in contract.tact
    131380 INT // (2 << 16) | (1 << 8) | 0x34
    NEWC
    24 STU
    16 STU
    16 STU
    256 STU
    256 STU
    ONE HASHEXT_SHA256 // obtains hash part (account id) of the address
    // → Stack state
    // s0: destAddr(hash part)
    // s1: `init.data`
    // s2: `init.code`
    // s3 and below: `bounce`, `value`, `body`, `mode`

    // Group 3: Building a message (CommonMsgInfoRelaxed)
    s3 XCHG0           // swaps `bounce` with destAddr(hash part)
    NEWC
    b{01} STSLICECONST // store tag = $0 and ihr_disabled = true
    1 STI              // store `bounce`
    s1 s2 XCHG         // swap `init.data` with `init.code`, placing code on s1
    STREF              // store `init.code`
    STREF              // store `init.data`
    // Inline StateInit:
    b{00010000000000} STSLICECONST
    // 0 + 00 + 10 + 0 + 00000000
    // 1) 0 - bounced = false
    // 2) 00 - src = addr_none
    // 3) 10 - tag of addr_std (part of dest)
    // 4) 0 - Maybe Anycast = false
    // 5) 00000000 - workchain_id (part of dest)
    //
    256 STU     // store destAddr(hash part)
    SWAP        // Builder on top, `value` below
    STGRAMS     // store `value`
    105 PUSHINT // 1 + 4 + 4 + 64 + 32
    STZEROES    // store currency_collection, ihr_fee, fwd_fee, created_lt and created_at

    // Group 4: Continue building a message (CommonMsgInfoRelaxed into MessageRelaxed)
    // Remaining bits of MessageRelaxed:
    b{1000110} STSLICECONST
    // 10 + 0 + 0 + 1 + 1 + 0
    // 10 - Maybe (Either StateInit ^StateInit) = true false
    // 0 - split_depth:(Maybe (## 5)) = false
    // 0 = special:(Maybe TickTock) = false
    // 1 = code:(Maybe ^Cell) = true
    // 1 = data:(Maybe ^Cell) = true
    // 0 = library:(Maybe ^Cell) = false
    //
    STDICT // store `body` as ref with an extra Maybe bit, since `body` might be null
    ENDC   // finalize the message
    // → Stack state
    // s0: Cell
    // s1: params.`mode`

    // Group 5: Sending the message, with `mode` on top
    SWAP
    SENDRAWMSG
}

/// Global function.
///
/// Queues the message to be sent by specifying the complete `cell` and the message `mode`.
///
/// Attempts to queue more than 255 messages throw an exception with an exit code 33: `Action list is too long`.
///
/// Prefer using a much more common and user-friendly `send()` function unless you have a complex logic that can't be expressed otherwise.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#nativesendmessage
/// * https://docs.tact-lang.org/ref/core-common#send
///
asm fun nativeSendMessage(cell: Cell, mode: Int) { SENDRAWMSG }

/// Global function. Available since Tact 1.5.0.
///
/// Similar to `nativeSendMessage()`, but also calculates and returns the forward fee in nanoToncoins.
///
/// Attempts to queue more than 255 messages throw an exception with an exit code 33: `Action list is too long`.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#nativesendmessagereturnforwardfee
/// * https://docs.tact-lang.org/ref/core-advanced#nativesendmessage
///
asm fun nativeSendMessageReturnForwardFee(msg: Cell, mode: Int): Int { SENDMSG }

/// Global function.
///
/// Queues the message `body` to be sent to the outer world with the purpose of logging and analyzing it later off-chain. The message does not have a recipient and is more gas-efficient compared to using any other message-sending functions of Tact.
///
/// The message is sent with the default mode: `SendDefaultMode` (0).
///
/// Attempts to queue more than 255 messages throw an exception with an exit code 33: `Action list is too long`.
///
/// ```tact
/// fun example() {
///     emit("Catch me if you can, Mr. Holmes".asComment()); // asComment() converts a String to a Cell
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-common#emit
///
inline fun emit(body: Cell) {
    // ext_out_msg_info$11 src:MsgAddressInt dest:MsgAddressExt created_lt:uint64 created_at:uint32
    //                     maybe: stateInit (false) bodyRef: bool (true)
    let c: Cell = beginCell()
        .storeUint(15211807202738752817960438464513, 104)
        .storeRef(body)
        .endCell();
    nativeSendMessage(c, 0);
}

/// Global function.
///
/// Agrees to buy some gas to finish the current transaction by setting the `gas_limit` to its maximum allowed value of 2^63 - 1 and resetting the `gas_credit` to 0. This action is required to process external messages, which bring no value (hence no gas) with themselves.
///
/// ```tact
/// contract Timeout {
///     timeout: Int;
///
///     init() {
///         self.timeout = now() + 5 * 60; // 5 minutes from now
///     }
///
///     external("timeout") {
///         if (now() > self.timeout) {
///             acceptMessage(); // start accepting external messages once timeout went out
///         }
///     }
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-advanced#acceptmessage
///
asm fun acceptMessage() { ACCEPT }

/// Global function.
///
/// Commits the current state of registers `c4` (persistent data) and `c5` (actions), so that the current execution is considered "successful" with the saved values even if an exception in compute phase is thrown later.
//
/// ```tact
/// fun example() {
///     commit();  // now, transaction is considered "successful"
///     throw(42); // and this won't fail it
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-advanced#commit
///
asm fun commit() { COMMIT }
