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
    e: Bool;
}

contract Linking {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: true,
                    },
                },
            },
        };
    }
}
