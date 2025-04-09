struct Level1 {
    foo: Int;
}

struct Level2 {
    a: Level1;
    b: Level1;
}

struct Level3 {
    c: Level2;
    d: Level2;
}

contract TwoLayerDup {
    val: Level3;

    init() {
        self.val = Level3{
            c: Level2{
                a: Level1{foo: 1},
                b: Level1{foo: 2},
            },
            d: Level2{
                a: Level1{foo: 3},
                b: Level1{foo: 4},
            },
        };
    }
}