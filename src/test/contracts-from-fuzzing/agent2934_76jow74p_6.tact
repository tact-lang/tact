struct Level3 {
    f1: Int;
    f2: String?;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract VeryDeepNested {
    root: Level1;

    init() {
        self.root = Level1{
            l2a: Level2{
                l3a: Level3{f1: 1, f2: null},
                l3b: Level3{f1: 2, f2: "deep"},
            },
            l2b: Level2{
                l3a: Level3{f1: 3, f2: null},
                l3b: Level3{f1: 4, f2: null},
            },
        };
    }
}