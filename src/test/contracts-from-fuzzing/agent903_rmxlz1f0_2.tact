struct Level3 {
    l3field: Int;
}

struct Level2 {
    l2field: Level3;
}

struct Level1 {
    l1field: Level2;
}

contract DeepHierarchy {
    nested: Level1;

    init() {
        self.nested = Level1{
            l1field: Level2{
                l2field: Level3{
                    l3field: 100
                }
            }
        };
    }
}