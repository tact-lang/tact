struct Level3 {
    v: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract Test {
    data: Level1;
    init() {
        self.data = Level1{ nested: Level2{ nested: Level3{ v: 42 } } };
    }
}