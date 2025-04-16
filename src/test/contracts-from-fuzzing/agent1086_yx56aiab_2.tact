struct DeeplyNested {
    a: Level1;
}

struct Level1 {
    b: Level2;
}

struct Level2 {
    c: Level3;
}

struct Level3 {
    value: Int;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            a: Level1{ b: Level2{ c: Level3{ value: 42 } } }
        };
    }
}