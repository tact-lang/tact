struct Level1 {
    a: Int;
}

struct Level2 {
    a: Level1;
    b: Int;
}

struct Level3 {
    a: Level2;
    b: Level1;
}

struct Level4 {
    a: Level3;
    b: Level2;
    c: Int;
}

contract MultiBranchNested {
    all: Level4;

    init() {
        self.all = Level4{
            a: Level3{
                a: Level2{ a: Level1{a: 1}, b: 2 },
                b: Level1{ a: 3 }
            },
            b: Level2{ a: Level1{a: 4}, b: 5 },
            c: 6
        };
    }
}