struct Level2 {
    x: Int;
}

struct Level1 {
    nested2: Level2;
}

contract DeepNestedTest {
    nested1: Level1;

    init() {
        self.nested1 = Level1{ nested2: Level2{ x: 99 } };
    }
}