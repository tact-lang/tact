struct LargeMixed {
    i1: Int;
    b1: Bool;
    s1: String;
    a1: Address;
    c1: Cell;
    sl1: Slice;
    i2: Int as uint8;
    b2: Bool?;
    s2: String?;
    a2: Address?;
    c2: Cell?;
    sl2: Slice?;
}

contract TestContract {
    data: LargeMixed;

    init() {
        self.data = LargeMixed{
            i1: 1,
            b1: true,
            s1: "hi",
            a1: myAddress(),
            c1: emptyCell(),
            sl1: emptyCell().asSlice(),
            i2: 123,
            b2: false,
            s2: null,
            a2: null,
            c2: null,
            sl2: null
        };
    }
}