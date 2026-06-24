struct Level3 {
    a: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract Test {
    f: Level1;
    init() {
        self.f = Level1{ nested: Level2{ nested: Level3{ a: 5 } } };
    }
}