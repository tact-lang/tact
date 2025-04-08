struct OneOpt {
    n: Int?;
}

struct TwoOpt {
    o1: OneOpt?;
}

contract OptionalChain {
    chain: TwoOpt;

    init() {
        self.chain = TwoOpt {
            o1: null
        };
    }
}