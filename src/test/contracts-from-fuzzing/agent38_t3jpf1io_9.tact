struct ChainA {
    x: Int;
}

struct ChainB {
    a: ChainA;
}

struct ChainC {
    b: ChainB;
}

struct ChainD {
    c: ChainC;
}

contract LongChainContract {
    data: ChainD;

    init() {
        self.data = ChainD{
            c: ChainC{
                b: ChainB{
                    a: ChainA{
                        x: 777,
                    },
                },
            },
        };
    }
}