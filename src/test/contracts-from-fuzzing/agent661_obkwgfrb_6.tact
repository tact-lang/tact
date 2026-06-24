struct Level3 {
    c: Int;
}

struct Level2 {
    b: Level3;
}

struct Level1 {
    a: Level2;
}

contract Chain {
    link: Level1;

    init() {
        self.link = Level1{ a: Level2{ b: Level3{ c: 42 } } };
    }
}