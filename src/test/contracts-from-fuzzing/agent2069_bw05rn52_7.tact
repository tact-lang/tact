struct DeeplyNestedOptional {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    x: Int;
    y: Bool;
}

contract DeepOptionalStorage {
    nested: DeeplyNestedOptional;

    init() {
        self.nested = DeeplyNestedOptional{ level1: null };
    }
}