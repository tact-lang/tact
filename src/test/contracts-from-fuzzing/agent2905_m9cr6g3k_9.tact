struct InnerMost { z: Int; }

struct Middle {
    m1: InnerMost;
    m2: InnerMost;
}

struct Outer {
    o1: Middle;
    o2: Middle;
}

contract WideNestedStructs {
    big: Outer;

    init() {
        self.big = Outer{
            o1: Middle{ m1: InnerMost{z:1}, m2: InnerMost{z:2} },
            o2: Middle{ m1: InnerMost{z:3}, m2: InnerMost{z:4} },
        };
    }
}