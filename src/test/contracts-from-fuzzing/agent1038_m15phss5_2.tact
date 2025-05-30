struct Level3 {
    a: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeepNestedStorage {
    data: Level1 = Level1{ nested: Level2{ nested: Level3{ a: 99 } } };
    init() {}
}