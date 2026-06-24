struct Level3 {
    f1: Int;
    f2: Bool?;
    f3: String;
}

struct Level2 {
    d1: Int;
    d2: Level3;
    d3: Bool;
}

struct Level1 {
    c1: Bool;
    c2: Level2;
    c3: Int;
}

contract DeepNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            c1: true,
            c2: Level2{
                d1: 42,
                d2: Level3{
                    f1: 10,
                    f2: null,
                    f3: "deep"
                },
                d3: false
            },
            c3: 7
        };
    }
}