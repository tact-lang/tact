struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Builder;
    g: Slice;
}

contract TestManyPrimitives {
    stuff: ManyPrimitives;

    init() {
        self.stuff = ManyPrimitives{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: beginCell(),
            g: emptyCell().asSlice()
        };
    }
}