struct InnerMost {
    value: Int;
}

struct Mid {
    inner: InnerMost;
}

struct OuterMost {
    mid: Mid;
}

contract DeepChain {
    chain: OuterMost;

    init() {
        self.chain = OuterMost{
            mid: Mid{ inner: InnerMost{ value: 99 } }
        };
    }
}