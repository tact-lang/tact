struct Level3 {
    foo: Int;
}

struct Level2 {
    a: Level3;
    b: Level3;
}

struct Level1 {
    x: Level2;
    y: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            x: Level2{
                a: Level3{foo:1},
                b: Level3{foo:2},
            },
            y: Level2{
                a: Level3{foo:3},
                b: Level3{foo:4},
            },
        };
    }
}