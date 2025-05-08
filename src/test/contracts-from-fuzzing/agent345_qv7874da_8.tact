struct Level3 {
    x: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeepContract {
    data: Level1;

    init() {
        self.data = Level1{ nested: Level2{ nested: Level3{ x: 42 } } };
    }
}