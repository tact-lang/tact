struct Level3 {
    value: Int;
}

struct Level2 {
    level3: Level3;
}

struct Level1 {
    level2: Level2;
}

contract DeepNestedStorage {
    data: Level1;

    init() {
        self.data = Level1{
            level2: Level2{
                level3: Level3{
                    value: 123
                }
            }
        };
    }
}