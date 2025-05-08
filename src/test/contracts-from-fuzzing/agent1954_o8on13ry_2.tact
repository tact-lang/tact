struct DeeplyNested {
    level: LevelOne;
}

struct LevelOne {
    level: LevelTwo;
}

struct LevelTwo {
    level: LevelThree;
}

struct LevelThree {
    val: Int;
}

contract DeepNestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            level: LevelOne{
                level: LevelTwo{
                    level: LevelThree{
                        val: 999,
                    },
                },
            },
        };
    }
}
