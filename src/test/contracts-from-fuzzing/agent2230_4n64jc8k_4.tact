struct MultiPrimitive {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
}

contract ManyPrimitiveFields {
    data: MultiPrimitive;

    init() {
        self.data = MultiPrimitive{
            a: 1,
            b: true,
            c: myAddress(),
            d: "hello",
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}