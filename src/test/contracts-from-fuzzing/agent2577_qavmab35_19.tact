struct ChainA {
    field: ChainB;
}

struct ChainB {
    field: ChainC;
}

struct ChainC {
    field: Int;
}

contract ChainContract {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            field: ChainB{
                field: ChainC{
                    field: 100
                }
            }
        };
    }
}
