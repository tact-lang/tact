struct Level3 {
    a: Int?;
    b: Bool?;
}

struct Level2 {
    c: Int;
    d: Level3;
}

struct Level1 {
    e: Bool;
    f: Level2;
}

contract MultiNest {
    g: Level1;
    
    init() {
        self.g = Level1 {
            e: true,
            f: Level2 {
                c: 10,
                d: Level3 {
                    a: null,
                    b: false,
                },
            },
        };
    }
}