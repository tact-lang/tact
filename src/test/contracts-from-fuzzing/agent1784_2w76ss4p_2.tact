struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract ManyPrimitiveFields {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            a: 1,
            b: false,
            c: "hello",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell()
        };
    }
}