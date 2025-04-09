struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
}

contract NestedComplex {
    inner: Complex;

    init() {
        self.inner = Complex{
            a: 9,
            b: null,
            c: "hi",
            d: null
        };
    }
}
