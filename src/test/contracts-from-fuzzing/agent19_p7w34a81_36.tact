struct LevelThree {
    foo: Int;
}

struct LevelTwo {
    lt: LevelThree;
}

struct LevelOne {
    ltt: LevelTwo;
}

contract DeepThreeLevels {
    top: LevelOne;

    init() {
        self.top = LevelOne{
            ltt: LevelTwo{
                lt: LevelThree{ foo: 999 },
            },
        };
    }
}