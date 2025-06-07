struct Outer {
    a: Int;
    b: Inner;
}

struct Inner {
    c: Int;
    d: InnerMost;
}

struct InnerMost {
    e: Int;
}

contract MultiDepth {
    field: Outer;

    init() {
        self.field = Outer{
            a: 1,
            b: Inner{
                c: 2,
                d: InnerMost{
                    e: 3,
                },
            },
        };
    }
}