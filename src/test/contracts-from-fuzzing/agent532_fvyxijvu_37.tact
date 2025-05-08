struct Level1 {
    a: Int;
}

struct Level2 {
    l1: Level1;
}

struct Level3 {
    l2: Level2;
}

contract DeepStorage {
    root: Level3;

    init() {
        self.root = Level3{ l2: Level2{ l1: Level1{ a: 42 } } };
    }
}