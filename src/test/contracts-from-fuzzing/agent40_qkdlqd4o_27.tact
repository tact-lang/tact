struct ChainA {
    b: ChainB;
}

struct ChainB {
    c: ChainC;
}

struct ChainC {
    s: String;
}

contract StorageStructChain {
    data: ChainA;

    init() {
        self.data = ChainA{
            b: ChainB{
                c: ChainC{
                    s: "bottom"
                }
            }
        };
    }
}