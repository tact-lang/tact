struct Level3 {
    d: Int;
}

struct Level2 {
    c1: Level3;
    c2: Level3;
}

struct Level1 {
    b1: Level2;
    b2: Level2;
}

contract TreeNested {
    root: Level1;

    init() {
        self.root = Level1{
            b1: Level2{
                c1: Level3{ d: 1 },
                c2: Level3{ d: 2 }
            },
            b2: Level2{
                c1: Level3{ d: 3 },
                c2: Level3{ d: 4 }
            }
        };
    }
}