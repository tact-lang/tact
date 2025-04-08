struct Deep {
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

contract Test {
    d: Deep;
    init() {
        self.d = Deep{ a: Level1{ b: Level2{ c: Level3{ d: 42 } } } };
    }
}