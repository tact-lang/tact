struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeepNested {
    state: Level1;

    init() {
        self.state = Level1{ nested: Level2{ nested: Level3{ val: 42 } } };
    }
}