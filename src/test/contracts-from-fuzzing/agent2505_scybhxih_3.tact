struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeeplyNested {
    data: Level1;

    init() {
        self.data = Level1{ nested: Level2{ nested: Level3{a: 123, b: false}} };
    }
}