struct DeepNested {
    level1: LevelOne;
}

struct LevelOne {
    level2: LevelTwo;
}

struct LevelTwo {
    level3: LevelThree;
}

struct LevelThree {
    flag: Bool?;
    count: Int;
    message: String;
}

contract StorageTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: LevelOne{
                level2: LevelTwo{
                    level3: LevelThree{
                        flag: null,
                        count: 123,
                        message: "test"
                    }
                }
            }
        };
    }
}