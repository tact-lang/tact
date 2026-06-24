struct Level3 {
    x: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

struct Root {
    l1: Level1;
}

contract DeepLevels {
    root: Root;

    init() {
        self.root = Root{
            l1: Level1{
                l2: Level2{
                    l3: Level3{
                        x: 99
                    }
                }
            }
        };
    }
}