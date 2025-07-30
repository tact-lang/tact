struct LevelOne {
    lvl2: LevelTwo;
}

struct LevelTwo {
    lvl3: LevelThree;
}

struct LevelThree {
    lvl4: LevelFour;
}

struct LevelFour {
    number: Int;
    word: String;
}

contract TestContract {
    nested: LevelOne;

    init() {
        self.nested = LevelOne{
            lvl2: LevelTwo{
                lvl3: LevelThree{
                    lvl4: LevelFour{
                        number: 42,
                        word: "nested"
                    }
                }
            }
        };
    }
}
