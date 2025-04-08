struct Level2 {
    value: Int?;
}

struct Level1 {
    nested: Level2;
}

contract DeepNested {
    data: Level1;
    init() {
        self.data = Level1{ nested: Level2{ value: null } };
    }
}