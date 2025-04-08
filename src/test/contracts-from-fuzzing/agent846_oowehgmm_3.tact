struct Level2 {
    flag: Bool;
}

struct Level1 {
    nested: Level2;
}

contract Test {
    s: Level1;

    init() {
        self.s = Level1{ nested: Level2{ flag: true } };
    }
}