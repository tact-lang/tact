struct InnerMost {
    x: Int;
}

struct Middle {
    i1: InnerMost;
    i2: InnerMost?;
}

struct Outer {
    m1: Middle;
    m2: Middle?;
}

contract Test23 {
    data: Outer = Outer{
        m1: Middle{ i1: InnerMost{ x: 1 }, i2: null },
        m2: null
    };
    init() {}
}
