struct Chain {
    x: Int;
}

contract ChainOpt {
    s: Chain?;
    init() {
        self.s = null;
    }
}