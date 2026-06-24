struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    s1: S1;
}

contract NestedOpts {
    f: S2?;

    init() {
        self.f = S2{ b: 5, s1: S1{ a: 7 } };
    }
}