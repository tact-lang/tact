struct Level3 {
    deepOpt: Int?;
}

struct Level2 {
    level3: Level3;
}

struct Level1 {
    level2: Level2;
}

contract DeepNest {
    l1: Level1;

    init() {
        self.l1 = Level1{
            level2: Level2{
                level3: Level3{
                    deepOpt: 42
                }
            }
        };
    }
}