struct Context {
    bounceable: Bool;
    sender: Address;
    value: Int;
    raw: Slice;
}

@name(__tact_context_get)
native context(): Context;

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
/// * https://docs.tact-lang.org/ref/core-advanced#contextreadforwardfee
/// * https://docs.tact-lang.org/ref/core-advanced#getoriginalfwdfee
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
    GETORIGINALFWDFEE // (fwd_fee * 2^16) / first_frac, where
                      // first_frac is a value listed in config param 25
                      // of the blockchain: https://tonscan.org/config#25
}
