struct Level1 {
    a: Int;
}

struct Level2 {
    l1a: Level1;
}

struct Level3 {
    l2a: Level2;
    b: Int;
}

contract ComplexCompose {
    root: Level3;

    init() {
        self.root = Level3{
            l2a: Level2{
                l1a: Level1{ a: 5 },
            },
            b: 10,
        };
    }
}