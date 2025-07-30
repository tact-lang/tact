struct ChainA {
    f1: Int;
    f2: ChainB;
}

struct ChainB {
    f3: Int;
    f4: ChainC;
}

struct ChainC {
    f5: Int;
}

contract TestChain {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            f1: 7,
            f2: ChainB{
                f3: 8,
                f4: ChainC{ f5: 9 }
            }
        };
    }
}