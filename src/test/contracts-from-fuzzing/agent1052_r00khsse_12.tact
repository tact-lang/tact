struct InnerMost {
    val: Int;
}

struct MidLevel {
    i1: InnerMost;
    i2: InnerMost;
}

struct OuterMost {
    m1: MidLevel;
    m2: MidLevel;
    m3: MidLevel;
}

contract ManyNested {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            m1: MidLevel{ i1: InnerMost{val:1}, i2: InnerMost{val:2} },
            m2: MidLevel{ i1: InnerMost{val:3}, i2: InnerMost{val:4} },
            m3: MidLevel{ i1: InnerMost{val:5}, i2: InnerMost{val:6} }
        };
    }
}