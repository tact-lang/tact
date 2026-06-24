struct Deep2 {
    s1: String;
    s2: String;
    flag: Bool;
}

struct Mid2 {
    d1: Deep2;
    d2: Deep2;
    b: Bool?;
}

struct Outer2 {
    m: Mid2;
    another: Int?;
}

contract NestedComplex {
    data: Outer2;

    init() {
        self.data = Outer2{
            m: Mid2{
                d1: Deep2{ s1: "a", s2: "b", flag: true },
                d2: Deep2{ s1: "x", s2: "y", flag: false },
                b: null
            },
            another: 123
        };
    }
}