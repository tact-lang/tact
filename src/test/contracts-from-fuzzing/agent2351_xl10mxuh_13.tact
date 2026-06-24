struct ComplexHuge {
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;
    s1: String;
    s2: String?;
    addr1: Address;
    addr2: Address?;
    c1: Cell;
    c2: Cell?;
    sl1: Slice;
    sl2: Slice?;
}

contract HugeComplexContract {
    store: ComplexHuge;

    init() {
        self.store = ComplexHuge{
            i1: 1, i2: null,
            b1: false, b2: null,
            s1: "hi", s2: null,
            addr1: myAddress(), addr2: null,
            c1: emptyCell(), c2: null,
            sl1: emptyCell().asSlice(), sl2: null
        };
    }
}
