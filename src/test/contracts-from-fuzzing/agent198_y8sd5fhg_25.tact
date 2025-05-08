struct Complex {
    i1: Int;
    o1: Int?;
    s1: String;
    o2: Bool?;
    b1: Bool;
    s2: String?;
}

contract ComplexPersistent {
    f: Complex;

    init() {
        self.f = Complex{
            i1: 1,
            o1: null,
            s1: "abc",
            o2: null,
            b1: true,
            s2: null
        };
    }
}
