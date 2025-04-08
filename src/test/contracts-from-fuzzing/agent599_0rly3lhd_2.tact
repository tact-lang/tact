struct DeepNest {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    leaf: Int?;
}

contract TestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            level1: Level1{
                level2: Level2{
                    level3: Level3{ leaf: null }
                }
            }
        };
    }
}