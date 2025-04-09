struct NestedStructManyLevels {
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
}

contract TestContract {
    nested: NestedStructManyLevels;

    init() {
        self.nested = NestedStructManyLevels{
            lv1: Level1{
                lv2: Level2{
                    lv3: Level3{
                        val: 42
                    }
                }
            }
        };
    }
}
