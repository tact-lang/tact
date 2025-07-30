struct DeeplyNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    num: Int;
    flag: Bool?;
}

contract TestNested {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        num: 99,
                        flag: null
                    }
                }
            }
        };
    }
}