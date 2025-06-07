struct OuterMost {
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

contract DeepHierarchyTest {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            lv1: Level1{
                lv2: Level2{
                    lv3: Level3{
                        val: 99
                    }
                }
            }
        };
    }
}
