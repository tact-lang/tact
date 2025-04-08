struct ChainA {
    x: Int;
}

struct ChainB {
    y: ChainA;
}

struct ChainC {
    z: ChainB;
}

contract Chain3 {
    f: ChainC;

    init() {
        self.f = ChainC{ z: ChainB{ y: ChainA{ x: 1 } } };
    }
}
