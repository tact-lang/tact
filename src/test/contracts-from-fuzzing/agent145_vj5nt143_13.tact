struct DeepArray {
    lv1: Level1;
}

struct Level1 {
    lv2: Level2;
}

struct Level2 {
    lv3: Level3;
}

struct Level3 {
    value: Int;
}

contract DeepChain {
    data: DeepArray;

    init() {
        self.data = DeepArray{
            lv1: Level1{
                lv2: Level2{
                    lv3: Level3{
                        value: 777,
                    }
                }
            }
        };
    }
}
