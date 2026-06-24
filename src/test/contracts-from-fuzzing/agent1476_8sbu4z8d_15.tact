struct LevelOne {
    b: Bool;
    s: String;
}

struct LevelTwo {
    l1: LevelOne;
    i: Int;
}

struct LevelThree {
    l2: LevelTwo;
    opt: Bool?;
}

contract MixedDeepPersistent {
    rec: LevelThree;

    init() {
        self.rec = LevelThree{
            l2: LevelTwo{
                l1: LevelOne{
                    b: false,
                    s: "hi",
                },
                i: 100,
            },
            opt: null,
        };
    }
}