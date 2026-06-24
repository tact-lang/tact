struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract LargeFields {
    data: Complex;

    init() {
        self.data = Complex{
            a: 42,
            b: true,
            c: "hello",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}