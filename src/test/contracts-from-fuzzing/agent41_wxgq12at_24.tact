struct Level3 {
    x: Int;
    y: Int;
}

struct Level2 {
    a: Level3;
    opt: Bool?;
}

struct Level1 {
    middle: Level2;
}

contract NestedNonNulls {
    root: Level1;

    init() {
        self.root = Level1{
            middle: Level2{
                a: Level3{x: 2, y: 3},
                opt: null,
            },
        };
    }
}
