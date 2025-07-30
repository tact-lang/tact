struct LongChain {
    a: Int;
    b: ChainB;
}

struct ChainB {
    c: Int;
    d: ChainC;
}

struct ChainC {
    e: Int;
    f: ChainD;
}

struct ChainD {
    g: Int;
    h: String;
}

contract TestContract {
    state: LongChain;

    init() {
        self.state = LongChain{
            a: 1,
            b: ChainB{
                c: 2,
                d: ChainC{
                    e: 3,
                    f: ChainD{
                        g: 4,
                        h: "end",
                    },
                },
            },
        };
    }
}