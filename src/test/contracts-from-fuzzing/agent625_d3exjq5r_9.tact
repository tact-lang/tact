struct Level0 {
    zero: Int;
    l1: Level1;
}

struct Level1 {
    one: Int;
    l2: Level2;
}

struct Level2 {
    two: Int;
    l3: Level3;
}

struct Level3 {
    three: Int;
}

contract Test {
    root: Level0;

    init() {
        self.root = Level0 {
            zero: 0,
            l1: Level1 {
                one: 1,
                l2: Level2 {
                    two: 2,
                    l3: Level3 {
                        three: 3
                    }
                }
            }
        };
    }
}