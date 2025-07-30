struct ChainLevel3 {
    z: Int;
}

struct ChainLevel2 {
    nested3: ChainLevel3;
}

struct ChainLevel1 {
    nested2: ChainLevel2;
}

contract ChainNestedTest {
    level1: ChainLevel1;
    init() {
        self.level1 = ChainLevel1{
            nested2: ChainLevel2{
                nested3: ChainLevel3{
                    z: 7
                }
            }
        };
    }
}
