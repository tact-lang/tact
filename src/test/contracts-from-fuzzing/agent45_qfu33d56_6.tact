struct Level3 {
    leaf: Int;
}

struct Level2 {
    mid: Level3;
}

struct Level1 {
    root: Level2;
}

struct Composite {
    c1: Level1;
    c2: Level1;
}

contract MultipleDeepNests {
    tree: Composite;

    init() {
        self.tree = Composite{
            c1: Level1{root: Level2{mid: Level3{leaf:11}}},
            c2: Level1{root: Level2{mid: Level3{leaf:22}}}
        };
    }
}