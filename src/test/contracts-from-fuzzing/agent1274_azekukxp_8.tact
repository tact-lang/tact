struct Level3 {
    x: Int;
    y: Int?;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract WideDeepMixed {
    composite: Level1;

    init() {
        self.composite = Level1{
            l2a: Level2{
                l3a: Level3{ x: 1, y: null },
                l3b: Level3{ x: 2, y: 3 },
            },
            l2b: Level2{
                l3a: Level3{ x: 4, y: null },
                l3b: Level3{ x: 5, y: 6 },
            },
        };
    }
}