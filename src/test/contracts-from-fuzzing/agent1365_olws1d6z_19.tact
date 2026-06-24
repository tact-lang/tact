struct Level3 {
    value: Int;
}

struct Level2 {
    next: Level3;
}

struct Level1 {
    next: Level2;
}

contract OptionalDeepNest {
    root: Level1?;

    init() {
        self.root = null;
    }
}