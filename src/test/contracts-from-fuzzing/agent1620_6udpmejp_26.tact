struct ChainOpt {
    inn: ChainOpt2?;
}

struct ChainOpt2 {
    val: Int?;
}

contract OptChainPers {
    f: ChainOpt;

    init() {
        self.f = ChainOpt{
            inn: ChainOpt2{ val: null }
        };
    }
}