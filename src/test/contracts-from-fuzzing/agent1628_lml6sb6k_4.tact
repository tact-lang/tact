struct MultiLevel {
    lvl1: Int;
    lvl2: LevelTwo;
}

struct LevelTwo {
    lvl3: LevelThree;
}

struct LevelThree {
    flag: Bool;
    text: String;
}

contract NestedMultiLevelContract {
    multi: MultiLevel;

    init() {
        self.multi = MultiLevel{
            lvl1: 42,
            lvl2: LevelTwo{
                lvl3: LevelThree{
                    flag: true,
                    text: "hello"
                }
            }
        };
    }
}