struct DeepNested {
    sub: LevelOne;
}

struct LevelOne {
    sub: LevelTwo;
}

struct LevelTwo {
    sub: LevelThree;
}

struct LevelThree {
    value: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            sub: LevelOne{
                sub: LevelTwo{
                    sub: LevelThree{
                        value: 42
                    }
                }
            }
        };
    }
}