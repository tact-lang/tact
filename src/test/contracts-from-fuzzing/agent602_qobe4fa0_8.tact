struct InnerMost {
    f: Int;
}

struct Inner {
    a: InnerMost;
    b: InnerMost;
}

struct Mid {
    x: Inner;
    y: Inner;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract TestContract {
    store: Top;

    init() {
        self.store = Top{
            m1: Mid{
                x: Inner{ a: InnerMost{f: 1}, b: InnerMost{f:2} },
                y: Inner{ a: InnerMost{f: 3}, b: InnerMost{f:4} },
            },
            m2: Mid{
                x: Inner{ a: InnerMost{f: 5}, b: InnerMost{f:6} },
                y: Inner{ a: InnerMost{f: 7}, b: InnerMost{f:8} },
            },
        };
    }
}