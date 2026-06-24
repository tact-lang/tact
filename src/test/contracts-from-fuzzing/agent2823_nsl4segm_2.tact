struct Level3 {
    val: Int?;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nest: Level2;
}

contract DeepNestedTest {
    payload: Level1;

    init() {
        self.payload = Level1{ nest: Level2{ nested: Level3{ val: 42 } } };
    }
}