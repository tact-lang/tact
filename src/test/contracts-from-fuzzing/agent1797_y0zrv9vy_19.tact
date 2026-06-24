struct Chain {
    n: ChainOpt;
}

struct ChainOpt {
    m: ChainOpt2?;
}

struct ChainOpt2 {
    z: Int;
}

contract Test {
    ch: Chain;
    init() {
        self.ch = Chain{
            n: ChainOpt{
                m: null
            }
        };
    }
}