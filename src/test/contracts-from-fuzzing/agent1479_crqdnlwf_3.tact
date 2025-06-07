struct Level3 {
    d: Int;
}

struct Level2 {
    c: Bool;
    nested3: Level3;
}

struct Level1 {
    a: Int;
    b: Level2;
}

contract Test {
    field: Level1;
    init() {
        self.field = Level1{
            a: 10,
            b: Level2{
                c: false,
                nested3: Level3{d: 99}
            }
        };
    }
}