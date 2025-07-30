struct Inner {
    a: Int;
    b: Int?;
}

struct Middle {
    m1: Inner;
    m2: Inner?;
}

struct Outer {
    o1: Middle;
    o2: Middle?;
}

contract Test {
    store: Outer;

    init() {
        self.store = Outer{
            o1: Middle{
                m1: Inner{ a: 1, b: null },
                m2: null,
            },
            o2: null,
        };
    }
}