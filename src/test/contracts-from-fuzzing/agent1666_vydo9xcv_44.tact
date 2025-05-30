struct BigNest {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    level4: Level4;
}

struct Level4 {
    num: Int;
}

contract DeepNestTest {
    field: BigNest;
    init() {
        self.field = BigNest{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        level4: Level4{
                            num: 777
                        }
                    }
                }
            }
        };
    }
}