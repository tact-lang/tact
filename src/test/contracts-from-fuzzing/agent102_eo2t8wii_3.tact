struct InnerMost {
    im1: Int;
    im2: Bool;
}

struct Middle {
    m1: Int;
    m2: InnerMost;
}

struct Outer {
    o1: Bool;
    o2: Middle;
}

contract DeepNestingTest {
    data: Outer;

    init() {
        self.data = Outer{
            o1: true,
            o2: Middle{
                m1: 5,
                m2: InnerMost{
                    im1: 100,
                    im2: false
                }
            }
        };
    }
}