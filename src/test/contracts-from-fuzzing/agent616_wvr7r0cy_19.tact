struct EmbedAddr {
    addr: Address;
}

struct EmbedSlice {
    s: Slice;
    inner: EmbedAddr;
}

contract MultiNest {
    store: EmbedSlice;

    init() {
        self.store = EmbedSlice{
            s: emptyCell().asSlice(),
            inner: EmbedAddr{addr: myAddress()}
        };
    }
}