struct Level3 {
    a: Int as int64;
    b: Int as uint4;
}

struct Level2 {
    c: Bool;
    d: Level3;
}

struct Level1 {
    e: Int;
    f: Level2;
}

contract SerializeNest {
    nested: Level1;

    init() {
        self.nested = Level1{
            e: 10,
            f: Level2{
                c: true,
                d: Level3{
                    a: -5,
                    b: 12,
                },
            },
        };
    }
}