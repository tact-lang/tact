struct InnerMost {
    val: Int;
}

struct Middle {
    left: InnerMost;
    right: InnerMost;
}

struct Top {
    m1: Middle;
    m2: Middle;
}

contract DeeplyLayered {
    state: Top;

    init() {
        self.state = Top{
            m1: Middle{
                left: InnerMost{val:1},
                right: InnerMost{val:2}
            },
            m2: Middle{
                left: InnerMost{val:3},
                right: InnerMost{val:4}
            }
        };
    }
}