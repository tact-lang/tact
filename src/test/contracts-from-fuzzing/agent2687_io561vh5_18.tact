struct AddrSliceStr {
    a: Address;
    s: Slice;
    str: String;
}

contract PrimitiveComposite {
    data: AddrSliceStr;

    init() {
        self.data = AddrSliceStr{
            a: myAddress(),
            s: emptyCell().asSlice(),
            str: "abc"
        };
    }
}