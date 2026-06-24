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
    e: ChainE;
}
struct ChainE {
    val: Int;
}

contract Chained {
    nested: ChainA;

    init() {
        self.nested = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: ChainE{
                            val: 55,
                        },
                    },
                },
            },
        };
    }
}