struct Level1 {
    a: Int;
}

struct Level2 {
    b: Bool;
    l1: Level1;
}

struct Level3 {
    l2a: Level2;
    l2b: Level2;
}

contract MultiBranchNest {
    deep: Level3;

    init() {
        self.deep = Level3{
            l2a: Level2{ b: true, l1: Level1{ a: 7 } },
            l2b: Level2{ b: false, l1: Level1{ a: 8 } }
        };
    }
}