struct ChainA {
    next: ChainB;
}

struct ChainB {
    next: ChainC;
}

struct ChainC {
    next: ChainD;
    flag: Bool;
}

struct ChainD {
    finalVal: Int;
}

contract TestContract {
    chain: ChainA;
    init() {
        self.chain = ChainA{
            next: ChainB{
                next: ChainC{
                    next: ChainD{ finalVal: 99 },
                    flag: true
                }
            }
        };
    }
}
