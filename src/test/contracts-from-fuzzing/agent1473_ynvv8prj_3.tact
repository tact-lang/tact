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

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3a: Level3{x: 1},
                l3b: Level3{x: 2}
            }
        };
    }
}