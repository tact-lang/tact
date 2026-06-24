struct ChainA {
    x: Int;
}

struct ChainB {
    a: ChainA;
}

struct ChainC {
    b: ChainB;
}

struct ChainD {
    c: ChainC;
}

contract DeepChain {
    val: ChainD;

    init() {
        self.val = ChainD{
            c: ChainC{
                b: ChainB{
                    a: ChainA{ x: 42 }
                }
            }
        };
    }
}