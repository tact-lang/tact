struct Level3 {
    leaf: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeeplyNested {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{ l3: Level3{ leaf: 256 } }
        };
    }
}