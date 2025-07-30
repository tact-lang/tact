struct InnerMost {
    val: Int;
}

struct InnerMid {
    im: InnerMost;
}

struct InnerOuter {
    mid: InnerMid;
}

contract NestedChain {
    chain: InnerOuter;

    init() {
        self.chain = InnerOuter {
            mid: InnerMid {
                im: InnerMost {
                    val: 123
                }
            }
        };
    }
}