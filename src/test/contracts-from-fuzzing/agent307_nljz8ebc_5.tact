struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Middle {
    inner1: InnerMost;
    inner2: InnerMost;
}

struct Outer {
    m1: Middle;
    m2: Middle;
    flag: Bool;
}

contract ComplexNested {
    state: Outer;

    init() {
        self.state = Outer{
            m1: Middle{
                inner1: InnerMost{ a: 1, b: null },
                inner2: InnerMost{ a: 2, b: true },
            },
            m2: Middle{
                inner1: InnerMost{ a: 3, b: false },
                inner2: InnerMost{ a: 4, b: null },
            },
            flag: true,
        };
    }
}