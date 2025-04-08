struct Complex {
    a: Int;
    optB: Bool?;
    s: Sub;
}

struct Sub {
    c: String;
    d: Int?;
}

contract NestedComplex {
    f: Complex;

    init() {
        self.f = Complex{ a:1, optB:null, s: Sub{c:"x", d:null} };
    }
}