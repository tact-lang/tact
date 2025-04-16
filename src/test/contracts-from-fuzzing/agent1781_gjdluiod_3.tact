struct Level3 {
    q: String?;
}

struct Level2 {
    p: Level3;
    r: Bool;
}

struct Level1 {
    m: Level2;
    n: Int;
}

contract DeeplyNested {
    s: Level1;

    init() {
        self.s = Level1{
            m: Level2{
                p: Level3{q: null},
                r: true
            },
            n: 100
        };
    }
}
