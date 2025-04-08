struct Level3 {
    value: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    inner: Level2;
}

contract DeepNested {
    storage: Level1;

    init() {
        self.storage = Level1{ inner: Level2{ nested: Level3{ value: 123 } } };
    }
}