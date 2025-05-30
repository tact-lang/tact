struct MultiPrim {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
}

contract PrimStorage {
    mp: MultiPrim;

    init() {
        self.mp = MultiPrim{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
        };
    }
}
