struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell;
    e: Slice;
    f: String?;
    g: Address;
}

contract ComplexFields {
    data: Complex;

    init() {
        self.data = Complex{
            a: 10,
            b: null,
            c: "text",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: null,
            g: myAddress(),
        };
    }
}