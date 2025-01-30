struct Context {
    bounced: Bool;
    sender: Address;
    value: Int;
    raw: Slice;
}

@name(__tact_context_get)
native context(): Context;

@name(__tact_context_get_sender)
native sender(): Address;

/*
In this function we need nothing but self.raw
So we will drop bounced, sender and value in the end
By 6 1 BLKDROP2.
*/
/*
int_msg_info$0 ihr_disabled:Bool bounce:Bool bounced:Bool
src:MsgAddress dest:MsgAddressInt
value:CurrencyCollection ihr_fee:Grams fwd_fee:Grams
created_lt:uint64 created_at:uint32 = CommonMsgInfoRelaxed;

Context.raw is a slice, that begins with dest
*/
asm extends fun readForwardFee(self: Context): Int {
    LDMSGADDR // Skip destination
    LDGRAMS // Skip value
    ONE
    SDSKIPFIRST // Skip extra currency collection
    LDGRAMS // Skip ihr_fee
    LDGRAMS // Load fwd_fee, we need this
    DROP // Drop remaining Slice
    // Fwd_fee that we need is on top of the stack
    6 1 BLKDROP2 // Drop ihr_fee, value(message), destination, value(context), sender, bounced
    ZERO // Masterchain - false
    GETORIGINALFWDFEE // Get original fwd_fee
}