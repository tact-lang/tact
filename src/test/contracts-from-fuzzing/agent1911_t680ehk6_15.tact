struct ChainA {
    next: ChainB;
}

struct ChainB {
    next: ChainC;
}

struct ChainC {
    next: ChainD;
}

struct ChainD {
    val: Int;
}

contract FourLayers {
    nested: ChainA;

    init() {
        self.nested = ChainA{
            next: ChainB{
                next: ChainC{
                    next: ChainD{
                        val: 42
                    }
                }
            }
        };
    }
}