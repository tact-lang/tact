struct Level3 {
    v3: Int;
}

struct Level2 {
    v2: Level3;
}

struct Level1 {
    v1: Level2;
}

contract Deep3Nesting {
    s: Level1;

    init() {
        self.s = Level1{ v1: Level2{ v2: Level3{ v3: 10 } } };
    }
}