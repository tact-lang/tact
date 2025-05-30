struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    sub: Level3;
    c: Int;
}

struct Level1 {
    nested: Level2;
    d: Bool;
}

contract DeepStruct {
    s: Level1;

    init() {
        self.s = Level1{
            nested: Level2{
                sub: Level3{ a: 1, b: false },
                c: 2
            },
            d: true
        };
    }
}