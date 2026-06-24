struct Level3 {
    f: Bool?;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract Test {
    data: Level1 = Level1{ nested: Level2{ nested: Level3{} } };
    init() {}
}