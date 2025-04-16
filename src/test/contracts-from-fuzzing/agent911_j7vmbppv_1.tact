contract TestDeepNestedOptional {
    field: Nested?;

    init() {
        self.field = null;
    }
}

struct Nested {
    level1: Level1;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    x: Int;
    y: Bool?;
}
