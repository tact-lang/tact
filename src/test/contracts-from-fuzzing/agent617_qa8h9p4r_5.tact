struct Level3 {
    q: Int;
}

struct Level2 {
    p: Level3;
}

struct Level1 {
    o: Level2;
}

contract DeepNested {
    s: Level1;
    init() {
        self.s = Level1{ o: Level2{ p: Level3{ q: 42 } } };
    }
}