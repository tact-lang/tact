struct ChainA {
    a: Int;
}

struct ChainB {
    a: ChainA;
}

struct ChainC {
    b: ChainB;
}

contract ChainContract {
    s: ChainC;

    init() {
        self.s = ChainC{ b: ChainB{ a: ChainA{ a: 1 } } };
    }
}
