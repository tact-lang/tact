struct Level3 {
    value: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNestedStruct {
    nested: Level1;

    init() {
        self.nested = Level1{ l2: Level2{ l3: Level3{ value: 42 } } };
    }
}