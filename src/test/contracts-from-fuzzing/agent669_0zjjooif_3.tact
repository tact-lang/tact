struct DeepOne {
    level2: LevelTwo;
}

struct LevelTwo {
    level3: LevelThree;
}

struct LevelThree {
    value: Int;
}

contract MultiLevel {
    deep: DeepOne;

    init() {
        self.deep = DeepOne{
            level2: LevelTwo{
                level3: LevelThree{
                    value: 55
                }
            }
        };
    }
}