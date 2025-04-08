struct LevelFour {
    s: String;
}
struct LevelThree {
    nested: LevelFour;
}
struct LevelTwo {
    nested: LevelThree;
}
struct LevelOne {
    nested: LevelTwo;
}

contract TestContract {
    deeply: LevelOne;
    init() {
        self.deeply = LevelOne{
            nested: LevelTwo{
                nested: LevelThree{
                    nested: LevelFour{
                        s: "deepnest"
                    }
                }
            }
        };
    }
}