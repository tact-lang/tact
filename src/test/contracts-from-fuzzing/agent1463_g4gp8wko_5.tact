struct ChainLevel3 {
    val: Int;
}

struct ChainLevel2 {
    next: ChainLevel3;
}

struct ChainLevel1 {
    next: ChainLevel2;
}

struct ChainRoot {
    next: ChainLevel1;
}

contract ChainTest {
    chain: ChainRoot;

    init() {
        self.chain = ChainRoot{
            next: ChainLevel1{
                next: ChainLevel2{
                    next: ChainLevel3{
                        val: 123
                    }
                }
            }
        };
    }
}
