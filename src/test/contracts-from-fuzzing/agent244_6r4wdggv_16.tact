struct ChainA {
    nested: ChainB;
}

struct ChainB {
    nested: ChainC;
}

struct ChainC {
    nested: ChainD;
}

struct ChainD {
    nested: ChainE;
}

struct ChainE {
    leaf: Int?;
}

contract DeepNullableChain {
    root: ChainA;

    init() {
        self.root = ChainA{
            nested: ChainB{
                nested: ChainC{
                    nested: ChainD{
                        nested: ChainE{
                            leaf: null
                        }
                    }
                }
            }
        };
    }
}