struct A {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Address;
}

contract PrimitiveFields {
    field: A;

    init() {
        self.field = A {
            a: 1,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: "test",
            f: myAddress()
        };
    }
}