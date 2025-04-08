struct ChainA {
    b: ChainB;
}

struct ChainB {
    c: ChainC;
}

struct ChainC {
    d: ChainD;
}

struct ChainD {
    val: Int = 1;
}

contract ChainTest {
    ch: ChainA = ChainA{ b: ChainB{ c: ChainC{ d: ChainD{} } } };

    init() {
        self.ch = ChainA{ b: ChainB{ c: ChainC{ d: ChainD{ val: 42 } } } };
    }
}