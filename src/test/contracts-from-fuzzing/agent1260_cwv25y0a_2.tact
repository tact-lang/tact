struct Level3 {
    deepInt: Int = 777;
}

struct Level2 {
    level3: Level3 = Level3{};
}

struct Level1 {
    level2: Level2 = Level2{};
}

contract DeepNestedTest {
    nested: Level1 = Level1{};

    init() {
        self.nested = Level1{
            level2: Level2{ level3: Level3{ deepInt: 888 } }
        };
    }
}