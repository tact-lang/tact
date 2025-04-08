struct ChainA {
    i: Int;
}

struct ChainB {
    a: ChainA;
    b: Bool;
}

struct ChainC {
    b: ChainB;
    s: String;
}

contract ChainABC {
    chain: ChainC;

    init() {
        self.chain = ChainC{
            b: ChainB{
                a: ChainA{ i: 123 },
                b: false,
            },
            s: "yo",
        };
    }
}