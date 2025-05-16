struct DeepOptionalStruct {
    s1: LevelOne?;
}

struct LevelOne {
    s2: LevelTwo?;
}

struct LevelTwo {
    val: Int?;
}

contract DeepOptionalsTest {
    s: DeepOptionalStruct;

    init() {
        self.s = DeepOptionalStruct {
            s1: LevelOne {
                s2: LevelTwo {
                    val: null
                }
            }
        };
    }
}