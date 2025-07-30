struct MultiLevel {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    value: Int;
}

contract MultiLevelNested {
    m: MultiLevel;

    init() {
        self.m = MultiLevel{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        value: 9999
                    }
                }
            }
        };
    }
}