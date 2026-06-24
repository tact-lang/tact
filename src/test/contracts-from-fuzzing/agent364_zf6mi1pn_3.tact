struct Level3 {
    value: Int?;
}

struct Level2 {
    opt: Level3?;
}

struct Level1 {
    wrapped: Level2?;
}

contract OptDeep {
    stored: Level1;

    init() {
        self.stored = Level1{ wrapped: null };
    }
}