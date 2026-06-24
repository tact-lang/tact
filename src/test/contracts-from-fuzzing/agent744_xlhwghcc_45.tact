struct MultiNestedAllOptional {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
    intVal: Int?;
}

struct Level2 {
    level3: Level3?;
    boolVal: Bool?;
}

struct Level3 {
    stringVal: String?;
}

contract TestContract {
    data: MultiNestedAllOptional;

    init() {
        self.data = MultiNestedAllOptional{ level1: null };
    }
}