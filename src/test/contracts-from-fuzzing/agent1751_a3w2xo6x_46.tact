struct OptionalChain {
    level1: ChainLevel1?;
}

struct ChainLevel1 {
    level2: ChainLevel2?;
}

struct ChainLevel2 {
    level3: ChainLevel3?;
}

struct ChainLevel3 {
    val: Int;
}

contract OptionalChainContract {
    chain: OptionalChain;

    init() {
        self.chain = OptionalChain{
            level1: ChainLevel1{
                level2: ChainLevel2{
                    level3: ChainLevel3{ val:100 }
                }
            }
        };
    }
}
