struct LevelOne {
    v: Int;
}

struct LevelTwo {
    l1: LevelOne;
}

struct LevelThree {
    l2: LevelTwo;
}

contract MultiLevel {
    f: LevelThree;
    init() {
        self.f = LevelThree{
            l2: LevelTwo{
                l1: LevelOne{
                    v: 777
                }
            }
        };
    }
}