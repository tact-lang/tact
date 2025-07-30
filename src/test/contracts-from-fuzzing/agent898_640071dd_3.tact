struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract MultiNest {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Middle{inner: InnerMost{val:1}},
            m2: Middle{inner: InnerMost{val:2}},
        };
    }
}
