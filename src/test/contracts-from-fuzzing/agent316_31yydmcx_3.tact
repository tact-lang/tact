struct Level3 {
    leaf1: Int?;
    leaf2: Bool;
}

struct Level2 {
    a: Level3;
    b: Int;
}

struct Level1 {
    sub: Level2;
}

contract Nested {
    field: Level1;

    init() {
        self.field = Level1{
            sub: Level2{
                a: Level3{ leaf1: null, leaf2: false },
                b: 10
            }
        };
    }
}