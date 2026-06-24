struct LevelOne {
    a: Int;
    levelTwo: LevelTwo;
}

struct LevelTwo {
    b: String;
    levelThree: LevelThree;
}

struct LevelThree {
    c: Bool;
    levelFour: LevelFour;
}

struct LevelFour {
    d: Int?;
}

contract MultilevelNestedOptions {
    data: LevelOne;

    init() {
        self.data = LevelOne{
            a: 5,
            levelTwo: LevelTwo{
                b: "deep",
                levelThree: LevelThree{
                    c: true,
                    levelFour: LevelFour{
                        d: null
                    }
                }
            }
        };
    }
}
