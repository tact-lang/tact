struct Level3 { 
    d: Int;
    e: String;
    f: Bool;
}

struct Level2 {
    b: Int;
    c: Level3;
}

struct Level1 {
    a: Level2;
}

contract ComplexNested {
    root: Level1;
    init() {
        self.root = Level1{
            a: Level2{
                b: 5,
                c: Level3{
                    d: 7,
                    e: "deep",
                    f: false,
                },
            },
        };
    }
}