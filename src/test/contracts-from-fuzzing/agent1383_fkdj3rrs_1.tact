struct DeepNesting {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    finalVal: Int;
}

contract DeepContract {
    nested: DeepNesting;

    init() {
        self.nested = DeepNesting{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        finalVal: 42,
                    },
                },
            },
        };
    }
}
