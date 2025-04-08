struct MultiNested {
    l1: Level1;
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    val: Int;
}

contract DeepTree {
    storage: MultiNested;

    init() {
        self.storage = MultiNested{
            l1: Level1{
                l2: Level2{
                    l3: Level3{val: 123}
                }
            }
        };
    }
}