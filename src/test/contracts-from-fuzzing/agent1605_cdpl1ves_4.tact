struct InnerMost {
    value: Int;
}

struct Inner {
    innerMost: InnerMost;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract NestedChain {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    innerMost: InnerMost{
                        value: 42
                    }
                }
            }
        };
    }
}