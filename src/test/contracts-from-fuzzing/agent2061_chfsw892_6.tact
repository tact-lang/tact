struct InnerMost {
    flag: Bool;
}

struct Mid {
    inner: InnerMost;
}

struct Outer {
    mid: Mid;
}

contract DeepChain {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid: Mid{
                inner: InnerMost{
                    flag: true,
                }
            }
        };
    }
}