struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Builder;
    g: Slice;
}

contract MultiPrimitives {
    v: ManyPrimitives;

    init() {
        self.v = ManyPrimitives{
            a: 1,
            b: true,
            c: "hey",
            d: myAddress(),
            e: emptyCell(),
            f: beginCell(),
            g: emptyCell().asSlice()
        };
    }
}
