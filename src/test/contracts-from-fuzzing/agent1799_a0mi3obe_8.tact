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

contract ChainDeep {
    root: ChainA;

    init() {
        self.root = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: ChainE{val: 999}
                    }
                }
            }
        };
    }
}
