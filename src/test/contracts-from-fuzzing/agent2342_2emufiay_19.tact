struct ChainA {
    val: Int;
}

struct ChainB {
    a: ChainA;
}

struct ChainC {
    b: ChainB;
}

contract ContractChainedNested {
    chain: ChainC;

    init() {
        self.chain = ChainC{
            b: ChainB{
                a: ChainA{ val: 999 }
            }
        };
    }
}