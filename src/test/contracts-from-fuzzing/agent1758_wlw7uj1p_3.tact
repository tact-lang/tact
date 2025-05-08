struct Level3 {
    x: Int;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2: Level2;
}

contract StorageTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3a: Level3{x: 5},
                l3b: Level3{x: 10},
            }
        };
    }
}