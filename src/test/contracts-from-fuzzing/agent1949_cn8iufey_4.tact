struct Complex {
    a: Int;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Builder?;
    g: Slice?;
}

contract OptFields {
    f1: Complex?;
    f2: Complex;
    f3: Complex?;

    init() {
        self.f1 = null;
        self.f2 = Complex{
            a: 42,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
        self.f3 = null;
    }
}
