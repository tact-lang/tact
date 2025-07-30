struct Inner {
    x: Int;
}

struct Middle {
    i1: Inner;
    i2: Inner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract T {
    d: Outer;

    init() {
        self.d = Outer{
            m1: Middle{ i1: Inner{ x:1 }, i2: Inner{ x:2 } },
            m2: Middle{ i1: Inner{ x:3 }, i2: Inner{ x:4 } }
        };
    }
}