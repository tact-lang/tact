struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract ManyPrimitiveFields {
    s: ManyPrimitives;

    init() {
        self.s = ManyPrimitives{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "test"
        };
    }
}