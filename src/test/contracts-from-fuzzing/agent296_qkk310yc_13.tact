struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComplexFields {
    val: Complex;

    init() {
        self.val = Complex{
            a: 1,
            b: true,
            c: "hello",
            d: null,
            e: false,
            f: "optional"
        };
    }
}
