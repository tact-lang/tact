struct Complex {
    a: Int;
    b: String;
    c: Bool;
}

contract OptStructField {
    maybe: Complex? = null;

    init() {
        self.maybe = Complex{ a: 12, b: "hi", c: false };
    }
}