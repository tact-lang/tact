struct Level3 {
    z: Bool = false;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract DeepNested {
    nested: Level1 = Level1{ x: Level2{ y: Level3{} } };
}