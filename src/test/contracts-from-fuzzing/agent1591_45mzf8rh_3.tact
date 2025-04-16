struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract MultiFields {
    record: Complex;

    init() {
        self.record = Complex{
            a: 1,
            b: true,
            c: "test",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}