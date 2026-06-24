struct PrimitiveMix {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
}

contract MixPrimitives {
    data: PrimitiveMix;

    init() {
        self.data = PrimitiveMix{
            i: 42,
            b: true,
            s: "hello",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell()
        };
    }
}