struct ChainA {
    f: Int;
}

struct ChainB {
    a: ChainA;
    f: Int?;
}

struct ChainC {
    b: ChainB;
    f: Int;
}

contract OptionalChain {
    data: ChainC;

    init() {
        self.data = ChainC{
            b: ChainB{
                a: ChainA{ f: 2 },
                f: null
            },
            f: 1
        };
    }
}