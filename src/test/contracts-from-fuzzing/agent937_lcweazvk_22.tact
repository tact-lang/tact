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
    x: Int;
    y: Bool;
}

contract DeepChainContract {
    data: ChainA;

    init() {
        self.data = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: ChainE{
                            x: 10,
                            y: true
                        }
                    }
                }
            }
        };
    }
}