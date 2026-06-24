struct ChainOpt {
    s: Int?;
}

contract OptChain {
    opt1: ChainOpt?;
    opt2: ChainOpt?;

    init() {
        self.opt1 = ChainOpt{ s: null };
        self.opt2 = null;
    }
}