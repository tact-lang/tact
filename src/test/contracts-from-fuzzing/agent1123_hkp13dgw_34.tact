struct MiddleOpt {
    s: String?;
}

struct OuterOpt {
    middle: MiddleOpt?;
}

contract OptChain {
    chain: OuterOpt;

    init() {
        self.chain = OuterOpt{middle:null};
    }
}