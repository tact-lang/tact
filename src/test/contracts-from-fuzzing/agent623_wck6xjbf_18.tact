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
    e: Int;
}

contract ChainTest {
    v: ChainA;

    init() {
        self.v = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: 123,
                    },
                },
            },
        };
    }
}