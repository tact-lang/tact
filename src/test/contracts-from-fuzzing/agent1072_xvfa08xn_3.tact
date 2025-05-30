struct Level3 {
    d: Bool;
}

struct Level2 {
    c: Level3;
}

struct Level1 {
    b: Level2;
}

contract DeepNested {
    a: Level1;

    init() {
        self.a = Level1{ b: Level2{ c: Level3{ d: true }}};
    }
}