struct DeeplyOptional {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    num: Int?;
}

contract MultiDeepNullableTest {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{ level1: null };
    }
}