struct DeepNest {
    a: Level1;
}

struct Level1 {
    b: Level2;
}

struct Level2 {
    c: Level3;
}

struct Level3 {
    d: Int;
}

contract DeepContract {
    data: DeepNest;
    init() {
        self.data = DeepNest{ a: Level1{ b: Level2{ c: Level3{ d: 42 } } } };
    }
}