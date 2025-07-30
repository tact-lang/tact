struct DeepNest {
    lvl1: Level1;
}

struct Level1 {
    lvl2: Level2;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    finalVal: Int;
    optBool: Bool?;
}

contract TestContract {
    info: DeepNest;

    init() {
        self.info = DeepNest{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{
                        finalVal: 42,
                        optBool: null
                    }
                }
            }
        };
    }
}