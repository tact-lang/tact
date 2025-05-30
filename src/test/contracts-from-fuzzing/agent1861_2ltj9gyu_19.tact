struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
}

contract ComplexFields {
    storage: Complex;

    init() {
        self.storage = Complex{
            a: 1,
            b: null,
            c: "test",
            d: null,
            e: emptyCell(),
        };
    }
}