struct LevelThree {
    deep: Int;
}

struct LevelTwo {
    nestedStruct: LevelThree;
}

struct LevelOne {
    nestedStruct: LevelTwo;
}

contract DeepNestedStorage {
    data: LevelOne;

    init() {
        self.data = LevelOne{
            nestedStruct: LevelTwo{
                nestedStruct: LevelThree{
                    deep: 42
                }
            }
        };
    }
}
