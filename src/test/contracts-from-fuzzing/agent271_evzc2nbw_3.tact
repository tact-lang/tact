struct Level3 {
    v: Int;
}

struct Level2 {
    inn: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeepNested {
    s: Level1;

    init() {
        self.s = Level1{ nested: Level2{ inn: Level3{ v: 7 } } };
    }
}
