struct Level0 {
    l1: Level1;
}
struct Level1 {
    l2: Level2;
}
struct Level2 {
    l3: Level3;
}
struct Level3 {
    l4: Level4;
}
struct Level4 {
    number: Int;
}

contract FuzzDeepHierarchy {
    root: Level0;

    init() {
        self.root = Level0 {
            l1: Level1 {
                l2: Level2 {
                    l3: Level3 {
                        l4: Level4 {
                            number: 777
                        }
                    }
                }
            }
        };
    }
}
