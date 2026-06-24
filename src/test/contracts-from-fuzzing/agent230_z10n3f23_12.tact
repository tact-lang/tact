struct Middle {
    m1: Int;
    m2: Int;
}

struct Top {
    t1: Int;
    m: Middle;
    t2: Int;
}

contract MiddleInclusion {
    top: Top;

    init() {
        self.top = Top {
            t1: 123,
            m: Middle {
                m1: 456,
                m2: 789
            },
            t2: 321
        };
    }
}
