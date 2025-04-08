struct PrimitiveVariants {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    addr: Address;
}

contract PrimitivesStructured {
    val: PrimitiveVariants;

    init() {
        self.val = PrimitiveVariants{
            i: 1,
            b: true,
            s: "hi",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            addr: myAddress(),
        };
    }
}
