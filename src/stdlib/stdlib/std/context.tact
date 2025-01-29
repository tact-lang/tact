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

asm extends fun readForwardFee(self: Context): Int {
    LDMSGADDR
    LDGRAMS
    ONE
    SDSKIPFIRST
    LDGRAMS
    LDGRAMS
    DROP
    6 1 BLKDROP2
    ZERO
    GETORIGINALFWDFEE
}