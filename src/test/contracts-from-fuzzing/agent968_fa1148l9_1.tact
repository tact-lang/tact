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
    finalValue: Int;
}

contract NestedContract {
    nestedField: DeeplyNested;
    init() {
        self.nestedField = DeeplyNested{
            level1: LevelOne{
                level2: LevelTwo{
                    level3: LevelThree{
                        finalValue: 42
                    }
                }
            }
        };
    }
}
