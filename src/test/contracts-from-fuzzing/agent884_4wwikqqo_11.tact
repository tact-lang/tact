struct ChainA {
    b: ChainB;
}

struct ChainB {
    c: ChainC;
}

struct ChainC {
    val: Int;
}

contract MultiChain {
    data: ChainA;

    init() {
        self.data = ChainA{ b: ChainB{ c: ChainC{ val:42 } } };
    }
}