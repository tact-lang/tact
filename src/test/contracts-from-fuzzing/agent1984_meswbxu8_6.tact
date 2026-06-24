struct InnerMost {
    d: Int;
}

struct Inner {
    b: InnerMost;
    c: InnerMost;
}

struct Outer {
    a: Inner;
}

contract NestedChains {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner{
                b: InnerMost{ d: 1 },
                c: InnerMost{ d: 2 },
            }
        };
    }
}