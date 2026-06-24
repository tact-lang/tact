struct ChainA {
    next: ChainB;
}

struct ChainB {
    next: ChainC;
}

struct ChainC {
    value: Int;
}

contract TestContract {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            next: ChainB{
                next: ChainC{
                    value: 100
                }
            }
        };
    }
}