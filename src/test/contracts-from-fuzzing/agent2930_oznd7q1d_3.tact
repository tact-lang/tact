struct DeepNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    deepVal: Int;
}

contract DeepStructStorage {
    ds: DeepNested;

    init() {
        self.ds = DeepNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        deepVal: 123
                    }
                }
            }
        };
    }
}
