struct Leaf {
    a: Int;
}

struct Level1 {
    leaf: Leaf;
}

struct Level2 {
    l1: Level1;
}

struct Level3 {
    l2: Level2;
}

struct Level4 {
    l3: Level3;
}

contract UltraDeepNest {
    storage: Level4;

    init() {
        self.storage = Level4 {
            l3: Level3 {
                l2: Level2 {
                    l1: Level1 {
                        leaf: Leaf { a: 101 }
                    }
                }
            }
        };
    }
}