struct LevelOne {
    x: Int;
}

struct LevelTwo {
    y: LevelOne;
}

struct LevelThree {
    z: LevelTwo;
}

struct LevelFour {
    w: LevelThree;
}

contract LargeNestedChain {
    store: LevelFour;

    init() {
        self.store = LevelFour{
            w: LevelThree{
                z: LevelTwo{
                    y: LevelOne{
                        x: 314
                    }
                }
            }
        };
    }
}