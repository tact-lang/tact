struct Level4 {
    flag: Bool;
}

struct Level3 {
    level4: Level4;
}

struct Level2 {
    level3: Level3;
}

struct Level1 {
    level2: Level2;
}

contract DeepOptionalChain {
    chain: Level1?;

    init() {
        self.chain = null;
    }
}
