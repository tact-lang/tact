struct DeepNested {
    first: LevelOne;
}

struct LevelOne {
    second: LevelTwo;
}

struct LevelTwo {
    third: LevelThree;
}

struct LevelThree {
    value: Int;
}

contract TestContract {
    deep: DeepNested;
    init() {
        self.deep = DeepNested{
            first: LevelOne{
                second: LevelTwo{
                    third: LevelThree{
                        value: 42
                    }
                }
            }
        };
    }
}
