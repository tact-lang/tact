struct Level3 {
    a: Int;
    b: Bool;
    c: String?;
}

struct Level2 {
    x: Level3;
    y: Level3?;
}

struct Level1 {
    m: Level2;
    n: Level2?;
}

contract OptionalNest {
    data: Level1;

    init() {
        self.data = Level1{
            m: Level2{
                x: Level3{a: 1, b: false, c: null},
                y: null
            },
            n: null
        };
    }

    receive() {
        let _ = self.data.m.x.a;
    }
}