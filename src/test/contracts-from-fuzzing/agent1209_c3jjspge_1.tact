struct DeepNestedOptional {
    inner: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    val: Int?;
}

contract Test {
    data: DeepNestedOptional;

    init() {
        self.data = DeepNestedOptional{ inner: null };
    }
}
