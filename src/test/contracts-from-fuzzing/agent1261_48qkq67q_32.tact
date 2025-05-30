struct Chain {
    inner: ChainOpt?;
}

struct ChainOpt {
    value: Int;
}

contract OptionChain {
    d: Chain;

    init() {
        self.d = Chain{ inner: null };
    }
}