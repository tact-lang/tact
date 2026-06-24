struct Primitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Builder;
    g: String;
}

contract AllPrimitives {
    p: Primitives;

    init() {
        self.p = Primitives{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: "test",
        };
    }
}