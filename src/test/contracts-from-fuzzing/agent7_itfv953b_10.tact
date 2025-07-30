struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract Chain {
    root: Level1;

    init() {
        self.root = Level1{ nested: Level2{ nested: Level3{ val: 99 } } };
    }
}