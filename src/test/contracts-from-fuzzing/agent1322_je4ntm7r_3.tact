struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Builder;
    f: Slice;
    g: String;
}

contract TestMixedPrimitives {
    field: ManyPrimitives;

    init() {
        self.field = ManyPrimitives{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: beginCell(),
            f: emptyCell().asSlice(),
            g: "hello"
        };
    }
}