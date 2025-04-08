struct Level3 {
    q: Int;
    r: Bool;
}

struct Level2 {
    e: Int;
    f: Bool;
    g: Level3;
}

struct Level1 {
    a: Int;
    b: Bool;
    c: Level2;
}

contract DeeplyNested {
    state: Level1;
    init() {
        self.state = Level1{
            a: 1,
            b: true,
            c: Level2{
                e: 10,
                f: false,
                g: Level3{ q: 100, r: true }
            }
        };
    }
}