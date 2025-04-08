struct LevelThree {
    z: Int;
}

struct LevelTwo {
    y: LevelThree;
}

struct LevelOne {
    x: LevelTwo;
}

contract DeepNestedPure {
    root: LevelOne;

    init() {
        self.root = LevelOne{
            x: LevelTwo{
                y: LevelThree{
                    z: 99,
                },
            },
        };
    }
}