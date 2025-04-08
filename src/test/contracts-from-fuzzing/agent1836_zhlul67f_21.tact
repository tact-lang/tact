struct ChainA {
    b: ChainB?;
}

struct ChainB {
    c: ChainC?;
}

struct ChainC {
    d: ChainD?;
}

struct ChainD {
    z: Int;
}

contract NestedOptChain {
    ref: ChainA;

    init() {
        self.ref = ChainA{ b: null };
    }
}