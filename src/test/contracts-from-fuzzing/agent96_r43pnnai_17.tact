struct InnerMost {
    val: Int;
}

struct MidInner {
    innermost: InnerMost?;
}

struct OuterMost {
    mid: MidInner?;
}

contract OptionChainPersistence {
    chain: OuterMost;

    init() {
        self.chain = OuterMost{
            mid: null
        };
    }
}