struct PrimitiveMix {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
}

contract BasePrimitivesTest {
    p: PrimitiveMix;

    init() {
        self.p = PrimitiveMix{
            a: 7,
            b: false,
            c: "string",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
        };
    }
}