struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract AllPrimitiveFields {
    stuff: ManyPrimitives;

    init() {
        self.stuff = ManyPrimitives{
            a: -1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
        };
    }
}
