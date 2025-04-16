struct ChainA {
    next: ChainB;
}

struct ChainB {
    next: ChainC;
}

struct ChainC {
    val: Int = 999;
}

contract TestContract {
    chain: ChainA;

    init() {
        self.chain = ChainA{ next: ChainB{ next: ChainC{} } };
    }
}
