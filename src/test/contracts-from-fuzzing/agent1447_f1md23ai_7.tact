struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l3: Level3;
    s: String;
}

struct Level1 {
    l2: Level2;
    b: Bool?;
}

contract DeepNest {
    field: Level1;

    init() {
        self.field = Level1{
            l2: Level2{
                l3: Level3{ a: 7, b: false },
                s: "deep"
            },
            b: null
        };
    }
}