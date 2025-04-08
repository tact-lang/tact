struct Level3 {
    a: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract ThreeNested {
    data: Level1 = Level1{ nested: Level2{ nested: Level3{ a: 42 } } };
}