struct NestedManyLevels {
    lv1: Level1;
}

struct Level1 {
    lv2: Level2;
}

struct Level2 {
    lv3: Level3;
}

struct Level3 {
    val: Int;
    flag: Bool;
    msg: String;
}

contract DeepChain {
    data: NestedManyLevels;
    init() {
        self.data = NestedManyLevels{
            lv1: Level1{
                lv2: Level2{
                    lv3: Level3{
                        val: 42,
                        flag: false,
                        msg: "deep"
                    }
                }
            }
        };
    }
}