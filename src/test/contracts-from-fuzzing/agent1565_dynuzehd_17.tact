struct InnerMost {
    value: Int;
}

struct Middle {
    im: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract NestedSingleChain {
    storage: Outer;

    init() {
        self.storage = Outer{
            mid: Middle{
                im: InnerMost{
                    value: 256
                }
            }
        };
    }
}