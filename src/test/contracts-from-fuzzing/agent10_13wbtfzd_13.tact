struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Int as uint8;
    f: Int?;
    g: String?;
    h: Address;
}

contract ComplexFields {
    val: Complex;

    init() {
        self.val = Complex{
            a: 1,
            b: null,
            c: "hi",
            d: null,
            e: 42,
            f: null,
            g: null,
            h: myAddress()
        };
    }
}
