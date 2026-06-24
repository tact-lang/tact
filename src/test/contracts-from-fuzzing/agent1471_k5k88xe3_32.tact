struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComplexState {
    field: Complex;

    init() {
        self.field = Complex{
            a: 1,
            b: true,
            c: "x",
            d: null,
            e: null,
            f: null,
        };
    }
}