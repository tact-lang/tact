struct ChainLevel3 {
    level3a: Int;
    level3b: Bool;
}

struct ChainLevel2 {
    level2a: ChainLevel3;
    level2b: Int;
}

struct ChainLevel1 {
    level1a: ChainLevel2;
    level1b: Bool;
}

contract ChainNestedContract {
    chain: ChainLevel1;

    init() {
        self.chain = ChainLevel1{
            level1a: ChainLevel2{
                level2a: ChainLevel3{
                    level3a: 100,
                    level3b: false
                },
                level2b: 50
            },
            level1b: true
        };
    }
}