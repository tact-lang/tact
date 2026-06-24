struct ChainA {
    next: ChainB;
}

struct ChainB {
    next: ChainC;
}

struct ChainC {
    foo: Int;
}

contract TestContract {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            next: ChainB{
                next: ChainC{
                    foo: 7,
                }
            }
        };
    }
}
