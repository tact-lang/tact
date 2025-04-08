struct MixedPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
}

contract MixedPrimitiveFields {
    data: MixedPrimitives;

    init() {
        self.data = MixedPrimitives{
            a: 1,
            b: false,
            c: myAddress(),
            d: "hi",
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}
