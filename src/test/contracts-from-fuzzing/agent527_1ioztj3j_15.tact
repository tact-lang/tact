struct ChainA {
    x: ChainB;
}

struct ChainB {
    y: ChainC;
}

struct ChainC {
    z: ChainD;
}

struct ChainD {
    w: Int;
}

contract DeepChain {
    val: ChainA;
    init() {
        self.val = ChainA{
            x: ChainB{
                y: ChainC{
                    z: ChainD{
                        w: 42,
                    }
                }
            }
        };
    }
}