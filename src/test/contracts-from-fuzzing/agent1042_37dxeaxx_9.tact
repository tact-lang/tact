struct SeveralPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
}

contract PrimitiveMix {
    x: SeveralPrimitives;

    init() {
        self.x = SeveralPrimitives{
            i: 11,
            b: true,
            s: "hi",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
        };
    }
}