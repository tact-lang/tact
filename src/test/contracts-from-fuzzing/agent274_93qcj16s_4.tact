struct ChainLevel3 {
    z: Int;
}

struct ChainLevel2 {
    inner3: ChainLevel3;
}

struct ChainLevel1 {
    inner2: ChainLevel2;
}

contract DeepChainTest {
    nested: ChainLevel1;

    init() {
        self.nested = ChainLevel1{
            inner2: ChainLevel2{
                inner3: ChainLevel3{
                    z: 999
                }
            }
        };
    }
}