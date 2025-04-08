struct Level3 {
    f: Int?;
    g: Bool;
}

struct Level2 {
    d: Int;
    e: Level3;
}

struct Level1 {
    a: Bool;
    b: Int;
    c: Level2;
}

contract DeepTree {
    data: Level1;

    init() {
        self.data = Level1{
            a: true,
            b: 42,
            c: Level2{
                d: 7,
                e: Level3{
                    f: null,
                    g: true,
                },
            },
        };
    }
}