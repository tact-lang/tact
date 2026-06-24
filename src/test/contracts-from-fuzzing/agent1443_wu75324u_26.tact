struct LevelFive {
    s: String;
}

struct LevelFour {
    lvl5: LevelFive;
    flag: Bool;
}

struct LevelThree {
    lvl4: LevelFour;
    optVal: Int?;
}

struct LevelTwo {
    lvl3: LevelThree;
}

struct LevelOne {
    lvl2: LevelTwo;
}

contract VeryDeepStruct {
    nested: LevelOne;

    init() {
        self.nested = LevelOne{
            lvl2: LevelTwo{
                lvl3: LevelThree{
                    lvl4: LevelFour{
                        lvl5: LevelFive{ s: "x" },
                        flag: false,
                    },
                    optVal: null,
                },
            },
        };
    }
}