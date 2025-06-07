struct Level3 {
    q: Int;
    r: Bool;
}

struct Level2 {
    m: Level3;
    n: Int?;
}

struct Level1 {
    a: Int;
    b: Level2;
    c: Level3?;
}

contract DeeplyNested {
    state: Level1;

    init() {
        self.state = Level1{
            a: 10,
            b: Level2{
                m: Level3{q: 7, r: true},
                n: null,
            },
            c: null,
        };
    }
}
