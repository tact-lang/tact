struct InnerMost {
    x: Int as uint8;
}

struct Middle {
    m1: InnerMost;
    m2: InnerMost;
}

struct TopMost {
    t1: Middle;
    t2: Middle;
}

contract QuadNested {
    data: TopMost;

    init() {
        self.data = TopMost{
            t1: Middle{ m1:InnerMost{ x:1 }, m2:InnerMost{ x:2 } },
            t2: Middle{ m1:InnerMost{ x:3 }, m2:InnerMost{ x:4 } }
        };
    }
}