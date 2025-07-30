struct Complex {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Address;
}

contract Test {
    complexField: Complex;

    init() {
        self.complexField = Complex{
            a: 1,
            b: null,
            c: true,
            d: "hi",
            e: myAddress()
        };
    }
}