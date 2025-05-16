struct Packed {
    i1: Int;
    b1: Bool;
    s1: String;
    a1: Address?;
    c1: Cell;
    sl1: Slice;
    i2: Int;
    b2: Bool;
    s2: String;
    a2: Address?;
    c2: Cell;
    sl2: Slice;
}

contract TestPacked {
    bigStruct: Packed;

    init() {
        self.bigStruct = Packed{
            i1: 1,
            b1: true,
            s1: "one",
            a1: null,
            c1: emptyCell(),
            sl1: emptyCell().asSlice(),
            i2: 2,
            b2: false,
            s2: "two",
            a2: null,
            c2: emptyCell(),
            sl2: emptyCell().asSlice()
        };
    }
}