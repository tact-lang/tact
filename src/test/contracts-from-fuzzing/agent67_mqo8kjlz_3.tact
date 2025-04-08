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
    val: Int;
    optStr: String?;
}

contract TestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{ val: 99, optStr: "hi" }
                }
            }
        };
    }
}