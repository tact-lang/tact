struct Complex {
    a: Int?;
    b: Bool;
    c: Cell;
    d: Address;
    e: String;
}

contract VariedFields {
    storage: Complex;

    init() {
        self.storage = Complex{
            a: null,
            b: true,
            c: emptyCell(),
            d: myAddress(),
            e: "hi"
        };
    }
}