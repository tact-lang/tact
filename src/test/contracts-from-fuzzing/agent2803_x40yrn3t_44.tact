struct ChainOpt1 {
    next: ChainOpt2?;
}

struct ChainOpt2 {
    next: ChainOpt3?;
}

struct ChainOpt3 {
    value: Int?;
}

contract ContractChainOptionals {
    c: ChainOpt1;

    init() {
        self.c = ChainOpt1{next:null};
    }
}