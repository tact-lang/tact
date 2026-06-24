struct InnerMost {
    x: Int;
}

struct Inner {
    im: InnerMost;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    im: InnerMost{
                        x: 123
                    }
                }
            }
        };
    }
}