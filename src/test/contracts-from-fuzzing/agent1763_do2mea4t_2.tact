struct Level3 {
    q: String;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNested {
    nested: Level1;

    init() {
        self.nested = Level1{ l2: Level2{ l3: Level3{ q: "deep" } } };
    }
}