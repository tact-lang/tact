struct InnerMost {
    data: Int;
}

struct MiddleOpt {
    mid: InnerMost?;
}

struct TopOpt {
    top: MiddleOpt?;
}

contract NestedOptionalChains {
    chain: TopOpt;

    init() {
        self.chain = TopOpt{
            top: null
        };
    }
}