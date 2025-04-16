struct Level3 {
    l3_1: Bool;
    l3_2: String;
}

struct Level2 {
    l2_1: Int;
    l2_2: Level3;
}

struct DeepNest {
    lvl1: Int;
    lvl2: Level2;
}

contract TestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            lvl1: 1,
            lvl2: Level2{
                l2_1: 2,
                l2_2: Level3{
                    l3_1: true,
                    l3_2: "hello"
                }
            }
        };
    }
}