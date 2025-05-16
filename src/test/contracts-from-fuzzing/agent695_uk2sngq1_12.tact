struct Level3 {
    n: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    nested: Level2;
}

contract Deep3 {
    data: Level1;

    init() {
        self.data = Level1{ nested: Level2{ inner: Level3{ n: 999 } } };
    }
}