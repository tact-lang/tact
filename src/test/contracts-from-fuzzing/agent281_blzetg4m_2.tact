struct SeveralPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract ManyPrimitiveFields {
    s: SeveralPrimitives;

    init() {
        self.s = SeveralPrimitives{
            a: 5,
            b: false,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello"
        };
    }
}