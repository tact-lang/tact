struct AddrWrap {
    a: Address;
}

struct SliceWrap {
    s: Slice;
}

contract Test15 {
    val1: AddrWrap;
    val2: SliceWrap;

    init() {
        self.val1 = AddrWrap{ a: myAddress() };
        self.val2 = SliceWrap{ s: emptyCell().asSlice() };
    }
}