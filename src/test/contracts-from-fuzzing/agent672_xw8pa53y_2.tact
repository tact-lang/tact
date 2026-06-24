struct Level3 {
    val: Int;
}

struct Level2 {
    nested3: Level3;
}

struct Level1 {
    nested2: Level2;
}

contract DeepNestedStructTest {
    data: Level1;
    init() {
        self.data = Level1{ nested2: Level2{ nested3: Level3{ val: 5 } } };
    }
}
