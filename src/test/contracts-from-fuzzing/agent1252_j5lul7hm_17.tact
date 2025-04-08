struct OnlyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract OnlyPrimitiveFields {
    p: OnlyPrimitives;

    init() {
        self.p = OnlyPrimitives{
            a: 11,
            b: false,
            c: "primitive",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}
