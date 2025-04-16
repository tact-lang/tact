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
    g: ChainG;
}

struct ChainG {
    value: Int;
}

contract LongChain {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: ChainE{
                            f: ChainF{
                                g: ChainG{
                                    value: 1
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
