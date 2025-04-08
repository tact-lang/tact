struct DeepNested {
    inner1: LevelOne;
}

struct LevelOne {
    inner2: LevelTwo;
    flag1: Bool;
}

struct LevelTwo {
    inner3: LevelThree;
    flag2: Bool?;
}

struct LevelThree {
    val: Int;
    note: String;
    optInner: LevelFour?;
}

struct LevelFour {
    description: String;
    finalFlag: Bool;
}

contract DeeplyNestedContract {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            inner1: LevelOne{
                inner2: LevelTwo{
                    inner3: LevelThree{
                        val: 5,
                        note: "depth",
                        optInner: null,
                    },
                    flag2: true,
                },
                flag1: false,
            }
        };
    }
}
