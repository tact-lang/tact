struct ChainA {
    a: Int;
}

struct ChainB {
    b: ChainA;
}

struct ChainC {
    c: ChainB;
}

contract ComposeChain {
    payload: ChainC;
    init() {
        self.payload = ChainC{
            c: ChainB{
                b: ChainA{
                    a: 5
                }
            }
        };
    }
}