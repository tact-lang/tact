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

contract NestingChainTest {
    top: ChainA;

    init() {
        self.top = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: ChainE{ val: 555 }
                    }
                }
            }
        };
    }
}
