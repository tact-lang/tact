struct ManyPrimitives {
    x: Int = 1;
    y: Bool = true;
    s: String = "hi";
    c: Cell;
    b: Builder;
    sl: Slice;
    addr: Address;
}

contract PrimitiveFields {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            x: 7,
            y: false,
            s: "ok",
            c: emptyCell(),
            b: beginCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
        };
    }
}