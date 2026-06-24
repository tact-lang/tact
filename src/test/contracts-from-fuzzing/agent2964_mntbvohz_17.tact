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
    e: Int?;
}

contract DeepChain {
    data: ChainA;
    init() {
        self.data = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: null
                    }
                }
            }
        };
    }
}