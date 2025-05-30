struct Level3 {
    leaf: Int;
}

struct Level2 {
    level3: Level3;
}

struct DeepNested {
    level2: Level2;
}

contract DeepStorage {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            level2: Level2{
                level3: Level3{
                    leaf: 123
                }
            }
        };
    }
}