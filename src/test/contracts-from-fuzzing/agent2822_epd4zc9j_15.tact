struct PrimitiveMix {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Builder;
    g: String;
}

contract AllPrimitives {
    p: PrimitiveMix;
    init() {
        self.p = PrimitiveMix {
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: "hi"
        };
    }
}