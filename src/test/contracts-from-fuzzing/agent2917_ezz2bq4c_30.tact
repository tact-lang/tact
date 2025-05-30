struct ChainA {
    next: ChainB;
}

struct ChainB {
    next: ChainC;
}

struct ChainC {
    leaf: Int;
}

contract ChainContract {
    chain: ChainA;

    init() {
        self.chain = ChainA{next: ChainB{next: ChainC{leaf: 3}}};
    }
}
