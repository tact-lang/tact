struct ChainA {
    count: Int;
}

struct ChainB {
    inner: ChainA;
}

struct ChainC {
    deep: ChainB;
}

contract DeepChain {
    nested: ChainC;

    init() {
        self.nested = ChainC{
            deep: ChainB{
                inner: ChainA{
                    count: 123
                }
            }
        };
    }
}