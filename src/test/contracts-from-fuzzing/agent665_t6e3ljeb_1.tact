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
    number: Int;
}

contract TestNested {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            level1: LevelOne{
                level2: LevelTwo{
                    level3: LevelThree{
                        number: 42
                    }
                }
            }
        };
    }
}
