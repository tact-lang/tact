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
    flag: Bool;
}

contract LongNestedChain {
    root: ChainA;

    init() {
        self.root = ChainA {
            b: ChainB {
                c: ChainC {
                    d: ChainD {
                        e: 888,
                        flag: true
                    }
                }
            }
        };
    }

    receive() {
        let v = self.root.b.c.d.e;
        let f = self.root.b.c.d.flag;
    }
}
