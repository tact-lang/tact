struct ChainA { v: Int; }
struct ChainB { a: ChainA; }
struct ChainC { b: ChainB; }
struct ChainD { c: ChainC; }
struct ChainE { d: ChainD; }

contract TestContract {
    root: ChainE;

    init() {
        self.root = ChainE {
            d: ChainD {
                c: ChainC {
                    b: ChainB {
                        a: ChainA { v: 999 },
                    },
                },
            },
        };
    }
}
