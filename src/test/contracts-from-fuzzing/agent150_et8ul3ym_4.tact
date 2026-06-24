struct InnerMost {
    x: Int;
    y: Int;
}
struct Middle {
    m1: InnerMost;
    m2: InnerMost;
}
struct Outer {
    o1: Middle;
    o2: Middle;
}

contract DeepArrays {
    data: Outer;

    init() {
        self.data = Outer{
            o1: Middle{
                m1: InnerMost{x: 1, y: 2},
                m2: InnerMost{x: 3, y: 4}
            },
            o2: Middle{
                m1: InnerMost{x: 5, y: 6},
                m2: InnerMost{x: 7, y: 8}
            }
        };
    }
}