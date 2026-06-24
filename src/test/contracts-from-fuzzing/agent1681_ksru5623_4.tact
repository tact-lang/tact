struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Middle {
    m1: InnerMost;
    m2: InnerMost?;
}

struct Top {
    t1: Middle;
    t2: Middle?;
}

contract NestedDepthTest {
    state: Top;

    init() {
        self.state = Top {
            t1: Middle {
                m1: InnerMost { a: 10, b: true },
                m2: null,
            },
            t2: null,
        };
    }
}