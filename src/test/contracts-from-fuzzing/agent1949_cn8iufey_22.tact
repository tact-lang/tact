struct DoubleNested {
    a: Int;
    b: Int?;
}

struct Outer {
    d1: DoubleNested?;
    d2: DoubleNested?;
}

contract OptOpt {
    f: Outer;

    init() {
        self.f = Outer{ d1: null, d2: null };
    }
}
