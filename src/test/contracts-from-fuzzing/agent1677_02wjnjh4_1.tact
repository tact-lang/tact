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
    flag: Bool;
    value: Int;
}

contract TestDeepNested {
    data: DeepNested = DeepNested{
        level1: Level1{
            level2: Level2{
                level3: Level3{
                    flag: true,
                    value: 123
                }
            }
        }
    };

    init() {
        self.data = DeepNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        flag: false,
                        value: 321
                    }
                }
            }
        };
    }
}
