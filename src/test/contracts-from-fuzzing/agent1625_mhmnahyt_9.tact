struct BigNested {
    level1: LevelOne;
}

struct LevelOne {
    level2: LevelTwo;
}

struct LevelTwo {
    x: Int;
    y: Int?;
}

contract UltraDeep {
    nest: BigNested;

    init() {
        self.nest = BigNested{
            level1: LevelOne{
                level2: LevelTwo{
                    x: 7,
                    y: null,
                }
            }
        };
    }
}
