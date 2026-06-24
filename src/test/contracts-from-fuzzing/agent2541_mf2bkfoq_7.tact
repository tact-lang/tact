struct DeepNest {
    a: Int;
    b: Int;
}

struct Level2 {
    inner1: DeepNest;
    inner2: DeepNest;
}

struct Level1 {
    nested1: Level2;
    nested2: Level2;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            nested1: Level2 {
                inner1: DeepNest{a: 1, b: 2},
                inner2: DeepNest{a: 3, b: 4}
            },
            nested2: Level2 {
                inner1: DeepNest{a: 5, b: 6},
                inner2: DeepNest{a: 7, b: 8}
            }
        };
    }
}