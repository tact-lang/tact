struct InnerMost {
    a: Int;
}

struct Inner {
    im: InnerMost;
}

struct Middle {
    inr: Inner;
}

struct Outer {
    mid: Middle;
}

contract DeepChain {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inr: Inner{
                    im: InnerMost{
                        a: 777
                    }
                }
            }
        };
    }
}