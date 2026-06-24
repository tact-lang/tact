struct InnerMost {
    d: Int;
}

struct Inner {
    c: InnerMost;
}

struct Middle {
    b: Inner;
}

struct OuterMost {
    a: Middle;
}

contract DeepChain {
    store: OuterMost;

    init() {
        self.store = OuterMost{
            a: Middle{
                b: Inner{
                    c: InnerMost{
                        d: 777
                    }
                }
            }
        };
    }
}