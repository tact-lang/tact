struct Level2 {
    x: Int;
}

struct Level1 {
    inner: Level2;
    y: Bool;
}

contract DeepNested {
    nested: Level1 = Level1{ inner: Level2{ x: 1 }, y: false };
}