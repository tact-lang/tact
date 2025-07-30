struct Level4 {
    deep: Int?;
}

struct Level3 {
    sub: Level4?;
}

struct Level2 {
    sub: Level3?;
}

struct Level1 {
    sub: Level2?;
}

contract NestedOptionalChain {
    chain: Level1;

    init() {
        self.chain = Level1{
            sub: Level2{
                sub: Level3{
                    sub: null
                }
            }
        };
    }
}
