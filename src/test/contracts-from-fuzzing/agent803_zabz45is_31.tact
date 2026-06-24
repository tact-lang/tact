struct ChainA {
    a: Int;
}

struct ChainB {
    b: ChainA;
}

struct ChainC {
    c: ChainB;
}

contract NestedChain {
    val: ChainC;
    init() {
        self.val = ChainC{
            c: ChainB{
                b: ChainA{ a: 321 }
            }
        };
    }
}