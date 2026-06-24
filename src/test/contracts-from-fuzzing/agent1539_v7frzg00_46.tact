struct ChainA {
    x: ChainB;
}
struct ChainB {
    y: ChainC;
}
struct ChainC {
    z: ChainD;
}
struct ChainD {
    w: Int;
}

contract NestedChain {
    data: ChainA;
    init() {
        self.data = ChainA{
            x: ChainB{
                y: ChainC{
                    z: ChainD{w:123}
                }
            }
        };
    }
}