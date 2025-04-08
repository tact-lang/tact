struct DeepNestedOptional {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    value: Int;
}

contract DeepTest {
    data: DeepNestedOptional;

    init() {
        self.data = DeepNestedOptional{ level1: null };
    }
}