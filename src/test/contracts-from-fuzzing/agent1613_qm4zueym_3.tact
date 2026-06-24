struct DeepNested {
    x: Int;
}

struct Middle {
    dn: DeepNested;
    opt: DeepNested?;
}

struct Top {
    m1: Middle;
    m2: Middle;
}

contract DeepNestTest {
    s: Top;

    init() {
        self.s = Top{
            m1: Middle{ dn: DeepNested{ x: 1 }, opt: null },
            m2: Middle{ dn: DeepNested{ x: 2 }, opt: DeepNested{ x: 3 } },
        };
    }
}