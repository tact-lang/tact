struct Level3 {
    x: Int;
    y: Bool?;
}

struct Level2 {
    q: Level3;
    r: Int;
}

struct Level1 {
    m: Level2;
    n: Bool;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            m: Level2{
                q: Level3{ x: 99, y: null },
                r: 100
            },
            n: true
        };
    }
}