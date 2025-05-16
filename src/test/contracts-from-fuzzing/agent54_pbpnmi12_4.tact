struct Level3 {
    value: Int;
}

struct Level2 {
    level3: Level3;
}

struct DeepNest {
    level2: Level2;
}

contract DeepNestedContract {
    nested: DeepNest;

    init() {
        self.nested = DeepNest{ level2: Level2{ level3: Level3{ value: 77 } } };
    }
}