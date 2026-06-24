struct MultiLevel {
    lvl1: LevelOne;
}

struct LevelOne {
    lvl2: LevelTwo;
}

struct LevelTwo {
    lvl3: LevelThree;
}

struct LevelThree {
    value: Int;
}

contract MultiLevelTest {
    val: MultiLevel;

    init() {
        self.val = MultiLevel{
            lvl1: LevelOne{
                lvl2: LevelTwo{
                    lvl3: LevelThree{
                        value: 77
                    }
                }
            }
        };
    }
}