struct DeepNest {
    level1: LevelOne;
}

struct LevelOne {
    level2: LevelTwo;
}

struct LevelTwo {
    level3: LevelThree;
}

struct LevelThree {
    x: Int;
    y: Int?;
}

contract TestContract {
    val: DeepNest;
    init() {
        self.val = DeepNest{
            level1: LevelOne{
                level2: LevelTwo{
                    level3: LevelThree{
                        x: 5,
                        y: null,
                    },
                },
            },
        };
    }
}