struct LevelOne {
    a: Int;
    b: String;
}

struct LevelTwo {
    lo: LevelOne;
    c: Bool;
}

struct LevelThree {
    lt: LevelTwo;
    d: Int?;
}

struct LevelFour {
    lth: LevelThree;
    txt: String?;
}

contract DeepOption {
    val: LevelFour;

    init() {
        self.val = LevelFour{
            lth: LevelThree{
                lt: LevelTwo{
                    lo: LevelOne{ a: 3, b: "b" },
                    c: true
                },
                d: null
            },
            txt: null
        };
    }
}
