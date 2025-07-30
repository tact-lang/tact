struct AddressWrap {
    addr: Address;
}

struct SliceWrap {
    slice: Slice;
}

contract NestedMixedPrimitives {
    a: AddressWrap;
    s: SliceWrap;

    init() {
        self.a = AddressWrap { addr: myAddress() };
        self.s = SliceWrap { slice: emptyCell().asSlice() };
    }
}
