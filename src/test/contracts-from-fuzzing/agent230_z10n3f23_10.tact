struct Complex {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
}

contract ComplexStructField {
    field: Complex;

    init() {
        self.field = Complex {
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 9,
            f: true
        };
    }
}
