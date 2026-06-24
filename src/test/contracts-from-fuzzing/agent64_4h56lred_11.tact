struct ComplexNest {
    a: Level1;
}

struct Level1 {
    b: Level2;
    c: Bool;
}

struct Level2 {
    d: Level3;
    e: Int;
}

struct Level3 {
    f: Level4;
    g: String;
}

struct Level4 {
    h: Int?;
    i: Bool?;
}

contract ComplexNestContract {
    store: ComplexNest = ComplexNest{
        a: Level1{
            b: Level2{
                d: Level3{
                    f: Level4{ h: null, i: true },
                    g: "data"
                },
                e: 42
            },
            c: false
        }
    };
}