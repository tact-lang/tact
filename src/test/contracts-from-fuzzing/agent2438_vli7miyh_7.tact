struct Level3 {
    data: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeepNesting {
    field: Level1;

    init() {
        self.field = Level1{ nested: Level2{ nested: Level3{ data: 123 } } };
    }
}
