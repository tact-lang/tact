struct InnerMost {
    x: Int;
}

struct Middle {
    m1: InnerMost;
    m2: InnerMost;
}

struct Outer {
    outerVal: Int;
    middle: Middle;
}

contract TestContract {
    field: Outer;
    init() {
        self.field = Outer{
            outerVal: 100,
            middle: Middle{
                m1: InnerMost{x:1},
                m2: InnerMost{x:2},
            }
        };
    }
}
