struct ComplexNested {
    a: Level1;
    b: Bool;
    c: Int;
}

struct Level1 {
    d: Level2;
    e: Bool?;
}

struct Level2 {
    f: Level3;
    g: Int?;
}

struct Level3 {
    h: Int;
    i: Bool;
}

contract TestContract {
    data: ComplexNested;

    init() {
        self.data = ComplexNested{
            a: Level1{
                d: Level2{
                    f: Level3{
                        h: 1,
                        i: true,
                    },
                    g: null,
                },
                e: null,
            },
            b: false,
            c: 100,
        };
    }
}