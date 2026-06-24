struct Level3 {
    leaf1: Int;
    leaf2: Bool;
}

struct Level2 {
    mid1: Level3;
    mid2: Level3;
}

struct Level1 {
    root: Level2;
}

contract NestedStructTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            root: Level2{
                mid1: Level3{leaf1: 1, leaf2: true},
                mid2: Level3{leaf1: 2, leaf2: false},
            },
        };
    }
}