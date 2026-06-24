struct LevelOne {
    levelTwo: LevelTwo;
    optionalLevelTwo: LevelTwo?;
}

struct LevelTwo {
    flag: Bool;
    text: String?;
}

contract Test {
    nested: LevelOne;

    init() {
        self.nested = LevelOne{
            levelTwo: LevelTwo{
                flag: true,
                text: null
            },
            optionalLevelTwo: null
        };
    }
}
