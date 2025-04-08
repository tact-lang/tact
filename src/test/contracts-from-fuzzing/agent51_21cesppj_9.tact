struct Level3 {
    x: Int;
}

struct Level2 {
    mid: Level3;
}

struct Level1 {
    top: Level2;
}

contract MultiNested {
    n: Level1;

    init() {
        self.n = Level1{ top: Level2{ mid: Level3{ x: 42 } } };
    }
}