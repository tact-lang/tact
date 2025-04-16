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
    val: Int;
}

contract TestChainNested {
    data: ChainA;

    init() {
        self.data = ChainA{
            b: ChainB {
                c: ChainC {
                    d: ChainD {
                        e: ChainE {
                            val: 1
                        }
                    }
                }
            }
        };
    }
}