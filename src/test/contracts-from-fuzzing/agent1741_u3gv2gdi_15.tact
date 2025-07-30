struct InnerMost {
    x: Int?;
    y: Bool?;
    z: Slice?;
}

struct Middle {
    f1: InnerMost;
    f2: InnerMost?;
}

struct Outer {
    m1: Middle;
    m2: Middle?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Middle{
                f1: InnerMost{x: null, y: null, z: null},
                f2: null
            },
            m2: null
        };
    }
}