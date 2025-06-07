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
    int_val: Int;
    bool_val: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            first: LevelOne{
                second: LevelTwo{
                    third: LevelThree{
                        int_val: 7,
                        bool_val: false,
                    },
                },
            },
        };
    }
}