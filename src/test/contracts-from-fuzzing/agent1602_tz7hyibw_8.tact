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
    val: Int;
}

contract VeryDeepChain {
    start: ChainA;

    init() {
        self.start = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        val: 99,
                    },
                },
            },
        };
    }
}
