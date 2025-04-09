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
    x: Int;
    y: Bool;
}

contract Test4 {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        x: 42,
                        y: true
                    }
                }
            }
        };
    }
}