struct ChainA {
    b: ChainB;
}

struct ChainB {
    c: ChainC;
}

struct ChainC {
    d: ChainD;
}

struct ChainD {
    e: ChainE;
}

struct ChainE {
    f: ChainF;
}

struct ChainF {
    last: Int;
}

contract DeepChainTest {
    chain: ChainA;
    init() {
        self.chain = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: ChainE{
                            f: ChainF{
                                last: 42,
                            }
                        }
                    }
                }
            }
        };
    }
}
