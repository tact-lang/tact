struct DeeplyNested {
    level1: LevelOne;
}

struct LevelOne {
    level2: LevelTwo;
}

struct LevelTwo {
    level3: LevelThree;
}

struct LevelThree {
    leaf: Int;
}

contract Test {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            level1: LevelOne{
                level2: LevelTwo{
                    level3: LevelThree{leaf: 42}
                }
            }
        };
    }
}