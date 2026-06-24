struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedOptionals {
    data: Complex;

    init() {
        self.data = Complex{ a: 1, b: false, c: "x", d: null, e: null, f: null };
    }
}
