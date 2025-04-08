struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestComplex {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: true,
            c: "str",
            d: null,
            e: null,
            f: null
        };
    }
}