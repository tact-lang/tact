struct ChainA {
    val: Int;
}
struct ChainB {
    c: ChainA;
}
struct ChainC {
    d: ChainB;
}

contract ChainStructCombo {
    data: ChainC;

    init() {
        self.data = ChainC { d: ChainB{ c: ChainA{ val:1 } } };
    }

    receive() {
        self.data = ChainC { d: ChainB{ c: ChainA{ val:2 } } };
    }
}