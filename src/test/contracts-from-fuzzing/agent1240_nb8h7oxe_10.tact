struct ChainA {
    val: Int;
}

struct ChainB {
    next: ChainA;
}

struct ChainC {
    next: ChainB;
}

struct ChainD {
    next: ChainC;
}

contract ChainTest {
    node: ChainD;
    init() {
        self.node = ChainD{ next: ChainC{ next: ChainB{ next: ChainA{ val: 1 } } } };
    }
}