struct InnerMost {
    val: Int;
}

struct Middle {
    im1: InnerMost;
    im2: InnerMost;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            m1: Middle{im1:InnerMost{val:1}, im2:InnerMost{val:2}},
            m2: Middle{im1:InnerMost{val:3}, im2:InnerMost{val:4}},
        };
    }
}