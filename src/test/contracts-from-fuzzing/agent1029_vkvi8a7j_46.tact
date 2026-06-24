struct NestedMixed {
    lvl1: LevelOne;
}

struct LevelOne {
    x: Int?;
    lvl2: LevelTwo;
}

struct LevelTwo {
    y: Bool;
    lvl3: LevelThree;
}

struct LevelThree {
    s: String?;
}

contract TestNestedMix {
    val: NestedMixed;
    init() {
        self.val = NestedMixed{
            lvl1: LevelOne{
                x: null,
                lvl2: LevelTwo{
                    y: true,
                    lvl3: LevelThree{
                        s: null
                    }
                }
            }
        };
    }
}
