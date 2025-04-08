struct InnerMost {
    v: Int = 7;
}

struct Inner {
    a: InnerMost;
    b: InnerMost;
}

struct Outer {
    left: Inner;
    right: Inner;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            left: Inner{
                a: InnerMost{},
                b: InnerMost{}
            },
            right: Inner{
                a: InnerMost{},
                b: InnerMost{}
            }
        };
    }
}