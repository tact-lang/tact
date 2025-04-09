struct Level3 {
    p: Int;
}

struct Level2 {
    x: Level3;
}

struct Level1 {
    y: Level2;
}

contract DeepContract {
    field: Level1;

    init() {
        self.field = Level1{ y: Level2{ x: Level3{ p: 42 } } };
    }
}