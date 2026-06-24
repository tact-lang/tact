struct BigNested {
    s1: S1;
    s2: S2;
}

struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    p: P;
}

struct P {
    m: String;
    n: Int;
}

contract NestedBigStruct {
    f: BigNested;

    init() {
        self.f = BigNested{
            s1: S1{ x: 1, y: true },
            s2: S2{ p: P{ m: "m", n: 2 } },
        };
    }
}