struct ChainA {
    optInt: Int?;
}

struct ChainB {
    a: ChainA?;
}

struct ChainC {
    b: ChainB?;
}

contract OptChain {
    data: ChainC;

    init() {
        self.data = ChainC { b: null };
    }
}