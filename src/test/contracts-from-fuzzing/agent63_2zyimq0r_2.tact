struct Level2 {
    inner: Int;
}

struct Level1 {
    nested: Level2;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{ nested: Level2{ inner: 7 } };
    }
}