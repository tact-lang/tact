struct Level2 {
    inner: Bool;
}

struct Level1 {
    nested: Level2;
}

contract DeeplyNested {
    field: Level1;

    init() {
        self.field = Level1{ nested: Level2{ inner: false } };
    }
}