struct Level3 {
    q: Int;
}

struct Level2 {
    inner3: Level3;
    p: Int;
}

struct Level1 {
    inner2: Level2;
    a: Int;
}

contract ComplexNested {
    field: Level1;

    init() {
        self.field = Level1{
            inner2: Level2{
                inner3: Level3{ q: 99 },
                p: 88,
            },
            a: 77,
        };
    }
}