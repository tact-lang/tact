struct Level3 {
    z: Int;
}

struct Level2 {
    nested3: Level3;
}

struct Level1 {
    nested2: Level2;
}

contract DeepNestedTest {
    top: Level1;

    init() {
        self.top = Level1{ nested2: Level2{ nested3: Level3{ z: 42 } } };
    }
}