struct Level3 {
    q: Int;
    r: Bool;
}

struct Level2 {
    m: Level3;
    n: Level3;
}

struct Level1 {
    x: Level2;
    y: Level2;
}

contract Test3 {
    nested: Level1;
    init() {
        self.nested = Level1{
            x: Level2{
                m: Level3{ q: 1, r: true },
                n: Level3{ q: 2, r: false }
            },
            y: Level2{
                m: Level3{ q: 3, r: false },
                n: Level3{ q: 4, r: true }
            }
        };
    }
}
