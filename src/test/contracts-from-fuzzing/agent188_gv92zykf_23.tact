struct InnerMost {
    a: Int;
}

struct Inner {
    im: InnerMost;
}

struct Middle {
    i: Inner;
}

struct Outer {
    m: Middle;
}

contract DeepChain {
    data: Outer;
    init() {
        self.data = Outer{
            m: Middle{
                i: Inner{
                    im: InnerMost{
                        a:321
                    }
                }
            }
        };
    }
}
