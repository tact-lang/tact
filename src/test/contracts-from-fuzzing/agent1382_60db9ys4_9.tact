struct InnerMost {
    val: Int;
}

struct Middle {
    i1: InnerMost;
    i2: InnerMost;
}

struct OuterMost {
    m1: Middle;
    m2: Middle;
    m3: Middle;
}

contract Layered {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            m1: Middle{ i1: InnerMost{val:1}, i2: InnerMost{val:2} },
            m2: Middle{ i1: InnerMost{val:3}, i2: InnerMost{val:4} },
            m3: Middle{ i1: InnerMost{val:5}, i2: InnerMost{val:6} }
        };
    }
}
