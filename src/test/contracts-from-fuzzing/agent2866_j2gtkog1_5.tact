struct InnerMost {
    flag: Bool;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract NestedOptionalsTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            m1: Middle{inner: null},
            m2: Middle{inner: InnerMost{flag: true}},
        };
    }

    receive() {}
}