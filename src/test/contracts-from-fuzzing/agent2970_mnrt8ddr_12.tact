struct InnerMost {
    foo: Int;
    bar: Bool;
}

struct Middle {
    test: InnerMost;
    opt: InnerMost?;
}

struct OuterMost {
    m1: Middle;
    m2: Middle;
}

contract TestContract {
    om: OuterMost;

    init() {
        self.om = OuterMost{
            m1: Middle{ test: InnerMost{ foo: 1, bar: true }, opt: null },
            m2: Middle{ test: InnerMost{ foo: 2, bar: false }, opt: null },
        };
    }
}