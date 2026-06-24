struct Level2 {
    d: Bool;
}

struct Level1 {
    c: Int;
    nested: Level2;
}

contract DeepNestedTest {
    data: Level1 = Level1{ c: 1, nested: Level2{ d: true } };
}