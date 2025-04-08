struct Complex {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract Mix {
    field: Complex;

    init() {
        self.field = Complex{ a: 1, b: "B", c: true, d: null, e: null, f: null };
    }
}