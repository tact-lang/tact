struct Complex {
    s: String;
    i: Int as uint32;
    b: Bool;
    o1: Int?;
    o2: String?;
}

contract ComplexUse {
    f: Complex;
    init() {
        self.f = Complex{
            s: "abc",
            i: 8,
            b: false,
            o1: null,
            o2: "optional",
        };
    }
}