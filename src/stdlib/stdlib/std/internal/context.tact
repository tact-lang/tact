/// Represents the context of the current message.
struct Context {
    /// Indicates whether the received message can
    /// [bounce back](https://docs.ton.org/v3/documentation/smart-contracts/message-management/non-bounceable-messages).
    bounceable: Bool;

    /// Internal address of the sender on the TON Blockchain.
    sender: Address;

    /// Amount of [nanoToncoin](https://docs.tact-lang.org/book/integers#nanotoncoin) in the received message.
    value: Int;

    /// The remainder of the received message as a `Slice`. It follows the [internal message layout]
    /// of TON, starting from the destination `Address` (`MsgAddressInt` in [TL-B notation]).
    ///
    /// [internal message layout]: https://docs.ton.org/develop/smart-contracts/messages#message-layout
    /// [TL-B notation]: https://docs.ton.org/develop/data-formats/tl-b-language
    raw: Slice;
}

/// Returns `Context` struct, which consists of:
///
/// * `bounceable` — Indicates whether the received message can [bounce back].
/// * `sender` — Internal address of the sender on the TON blockchain.
/// * `value` — Amount of [nanoToncoin] in the received message.
/// * `raw` — The remainder of the received message as a `Slice`. It follows the [internal message layout] of TON, starting from the destination `Address` (`MsgAddressInt` in [TL-B notation]).
///
/// ```tact
/// fun test() {
///     let ctx: Context = context();
///     require(ctx.value != 68 + 1, "Invalid amount of nanoToncoins, bye!");
/// }
/// ```
///
/// Note: If you only need to know who sent the message, use the `sender()` function,
/// as it is less gas-consuming.
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#context
///
/// [bounce back]: https://docs.ton.org/v3/documentation/smart-contracts/message-management/non-bounceable-messages
/// [nanoToncoin]: https://docs.tact-lang.org/book/integers#nanotoncoin
/// [internal message layout]: https://docs.ton.org/develop/smart-contracts/messages#message-layout
/// [TL-B notation]: https://docs.ton.org/develop/data-formats/tl-b-language
///
@name(__tact_context_get)
native context(): Context;

/// Global function. Available since Tact 1.6.7.
///
/// Returns the `Slice` with the original, raw body of the received message.
///
/// That `Slice` can:
///
/// * be empty, which means the contract has received an empty message body that is handled in the empty receiver `receive()` or the catch-all slice receiver `receive(msg: Slice)`;
/// * start with 4 zero bytes, which means the contract has received a text message that is handled in the relevant receiver:
///   * the exact text receiver `receive("message")`,
///   * the catch-all string receiver `receive(msg: String)`,
///   * or the catch-all slice receiver `receive(msg: Slice)`;
/// * start with 4 bytes of a non-zero message opcode that the corresponding binary receiver `receive(msg: MessageStruct)` or the catch-all slice receiver `receive(msg: Slice)` would handle.
///
/// ```tact
/// // This contract defines various kinds of receivers in their
/// // order of handling the corresponding incoming messages.
/// contract OrderOfReceivers() {
///     receive() {
///         let body = inMsg();
///         body.bits(); // 0
///     }
///
///     receive("yeehaw!") {
///         let body = inMsg();
///         body.loadUint(32); // 0
///         body.hash() == "yeehaw!".asSlice().hash(); // true
///     }
///
///     receive(str: String) {
///         let body = inMsg();
///         body.loadUint(32); // 0
///         body == str.asSlice(); // true
///     }
///
///     receive(msg: Emergency) {
///         let body = inMsg();
///         body.preloadUint(32); // 911
///     }
///
///     receive(rawMsg: Slice) {
///         let body = inMsg();
///         body == rawMsg; // true
///     }
/// }
///
/// message(911) Emergency {}
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#inmsg
///
@name(__tact_in_msg_get)
native inMsg(): Slice;

/// Returns the `Address` of the sender of the current message.
///
/// ```tact
/// contract MeSee {
///     receive() {
///         let whoSentMeMessage: Address = sender();
///     }
/// }
/// ```
///
/// Note: Behavior is undefined for [getter functions], because they cannot have a sender
/// nor can they send messages.
///
/// Tip: To reduce gas usage, prefer using this function over calling `context().sender`
/// when you only need to know the sender of the message.
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#sender
///
/// [getter functions]: https://docs.tact-lang.org/book/contracts#getter-functions
///
@name(__tact_context_get_sender)
native sender(): Address;

/// Extension function for the `Context` structure.
///
/// Reads forward fee and returns it as `Int` amount of nanoToncoins.
///
/// ```tact
/// fun example() {
///     let fwdFee: Int = context().readForwardFee();
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-contextstate#contextreadforwardfee
/// * https://docs.tact-lang.org/ref/core-gas#getoriginalfwdfee
///
asm extends fun readForwardFee(self: Context): Int {
    // Only the self.raw (Context.raw) is important,
    // so all the other fields and loaded values will be dropped by `BLKDROP2`
    //
    // Context.raw starts at the dest:MsgAddressInt, following this TL-B scheme:
    // int_msg_info$0
    //   ihr_disabled:Bool
    //   bounce:Bool
    //   bounced:Bool
    //   src:MsgAddress
    //   dest:MsgAddressInt ← here is the start
    //   value:CurrencyCollection
    //   ihr_fee:Grams
    //   fwd_fee:Grams
    //   created_lt:uint64
    //   created_at:uint32
    // = CommonMsgInfoRelaxed;

    LDMSGADDR   // load dest:MsgAddressInt
    LDGRAMS     // load value:CurrencyCollection
    ONE
    SDSKIPFIRST // skip extra currency collection
    LDGRAMS     // load ihr_fee
    LDGRAMS     // load fwd_fee, we'll be using this!
    DROP        // drop remaining Slice (with created_lt and created_at)

    // There are 7 entries on the stack — first 3 fields of Context plus 4 loaded ones.
    // The topmost is fwd_fee, which is the only one we're after, so let's drop 6 entries below:
    6 1 BLKDROP2 // drop the loaded values as well as the first 3 fields of Context

    ZERO              // not masterchain
    GETORIGINALFWDFEE // floor(fwd_fee * 2^16 / (2^16 - first_frac)), where
                      // first_frac is a value listed in config param 25
                      // of the blockchain: https://tonviewer.com/config#25
                      // this instruction effectively multiplies the fwd_fee by 1.5,
                      // at least for the current value of first_frac, which is 21845
}
