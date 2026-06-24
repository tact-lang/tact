struct PrimitiveFields {
    b: Bool;
    n: Int;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
}

contract PrimitiveTest {
    data: PrimitiveFields;

    init() {
        self.data = PrimitiveFields{
            b: true,
            n: 42,
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            a: myAddress(),
        };
    }
}