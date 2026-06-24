struct Complex {
    a: Int?;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract ComplexTest {
    data: Complex;
    init() {
        self.data = Complex {
            a: null,
            b: true,
            c: "hello",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}