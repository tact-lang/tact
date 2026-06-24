struct S {
    val: Int?;
}

struct Outer {
    s1: S;
    s2: S?;
}

contract OptionalMix {
    f: Outer;

    init() {
        self.f = Outer{
            s1: S{ val: null },
            s2: null,
        };
    }
}
