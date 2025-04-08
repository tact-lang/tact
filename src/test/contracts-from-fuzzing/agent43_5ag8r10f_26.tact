contract ChainOptionalNested {
    a: Level1?;

    init() {
        self.a = Level1{ b: Level2{ c: null } };
    }
}

struct Level1 {
    b: Level2?;
}

struct Level2 {
    c: Level3?;
}

struct Level3 {
    x: Int;
}