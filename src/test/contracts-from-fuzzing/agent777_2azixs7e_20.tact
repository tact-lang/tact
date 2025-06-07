struct Levels3 {
    a: Int;
}

struct Levels2 {
    l3: Levels3;
    b: Int;
}

struct Levels1 {
    l2: Levels2;
    c: Int;
}

contract LevelDepth {
    value: Levels1;

    init() {
        self.value = Levels1{
            l2: Levels2{
                l3: Levels3{ a: 10 },
                b: 20
            },
            c: 30
        };
    }
}