struct ChainA {
    a: Int;
}

struct ChainB {
    b: ChainA;
    c: Int?
}

struct ChainC {
    d: ChainB;
    e: Bool?;
}

contract NestedChain {
    val: ChainC;

    init() {
        self.val = ChainC{
            d: ChainB{
                b: ChainA{a: 11},
                c: null,
            },
            e: true,
        };
    }
}