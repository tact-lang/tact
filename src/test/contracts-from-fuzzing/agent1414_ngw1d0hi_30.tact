struct X {
    a: Int;
    b: Bool;
}

struct Y {
    c: X;
    d: Int;
}

struct Z {
    e: Y;
    f: String?;
}

contract MultiNestedMix {
    rec: Z;

    init() {
        self.rec = Z{
            e: Y{
                c: X{ a: 1, b: false },
                d: 42
            },
            f: null
        };
    }
}