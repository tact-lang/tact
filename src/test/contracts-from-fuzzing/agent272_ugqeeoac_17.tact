struct Complex {
    a: Int?;
    b: Bool;
    c: String?;
    d: Int;
    e: Bool?;
    f: String;
}

contract ComplexPersist {
    cf: Complex;

    init() {
        self.cf = Complex{
            a: null,
            b: true,
            c: "val",
            d: 77,
            e: false,
            f: "zzz"
        };
    }
}