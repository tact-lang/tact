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

contract ChainNestedFields {
    state: ChainA;

    init() {
        self.state = ChainA {
            b: ChainB {
                c: ChainC {
                    d: ChainD {
                        e: 42
                    }
                }
            }
        };
    }
}