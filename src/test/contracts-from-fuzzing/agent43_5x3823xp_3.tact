struct Innermost {
    i1: Int;
}

struct Inner {
    inner: Innermost;
}

struct Mid {
    inr: Inner;
}

struct Outer {
    md: Mid;
}

contract DeepestChain {
    s: Outer;

    init() {
        self.s = Outer{
            md: Mid{
                inr: Inner{
                    inner: Innermost{i1: 1}
                }
            }
        };
    }
}
