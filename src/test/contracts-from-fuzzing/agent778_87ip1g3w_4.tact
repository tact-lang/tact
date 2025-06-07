struct Level2 {
    a: Int;
    b: Bool;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract DeepNestedTest {
    value: Level1;
    init() {
        self.value = Level1{ nested: Level2{ a: 5, b: true }, flag: false };
    }
}