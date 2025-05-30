struct Level3 {
    value: Bool;
}

struct Level2 {
    lev3: Level3;
}

struct Level1 {
    lev2: Level2;
}

contract StructChain {
    chain: Level1;

    init() {
        self.chain = Level1{
            lev2: Level2{
                lev3: Level3{ value: true }
            }
        };
    }
}