struct Leaf {
    x: Int;
}

struct Level2 {
    l1: Leaf;
    l2: Leaf;
}

struct Level1 {
    a: Level2;
    b: Level2;
}

contract DeeplyNestedStorage {
    deepField: Level1;
    init() {
        self.deepField = Level1{
            a: Level2{ l1: Leaf{ x: 1 }, l2: Leaf{ x: 2 } },
            b: Level2{ l1: Leaf{ x: 3 }, l2: Leaf{ x: 4 } }
        };
    }
}