struct InnerX {
    a: Int;
}

struct MidX {
    inner1: InnerX;
    inner2: InnerX;
}

struct TopX {
    mid1: MidX;
    mid2: MidX;
}

contract DiamondNesting {
    data: TopX;
    init() {
        self.data = TopX{
            mid1: MidX{
                inner1: InnerX{a: 1},
                inner2: InnerX{a: 2}
            },
            mid2: MidX{
                inner1: InnerX{a: 3},
                inner2: InnerX{a: 4}
            }
        };
    }
}