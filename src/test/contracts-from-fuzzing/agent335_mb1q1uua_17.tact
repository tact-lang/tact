struct ChainA { val: Int; }
struct ChainB { nested: ChainA; }
struct ChainC { nested: ChainB; }
struct ChainD { nested: ChainC; }
struct ChainE { nested: ChainD; }

contract DeepChainContract {
    data: ChainE;

    init() {
        self.data = ChainE{
            nested: ChainD{
                nested: ChainC{
                    nested: ChainB{
                        nested: ChainA{val:77}
                    }
                }
            }
        };
    }
}