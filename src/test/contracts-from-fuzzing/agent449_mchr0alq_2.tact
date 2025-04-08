struct Level3 {
    a: Int?;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNestedStructStorage {
    nested: Level1;

    init() {
        self.nested = Level1{ l2: Level2{ l3: Level3{ a: 5 } } };
    }
}
