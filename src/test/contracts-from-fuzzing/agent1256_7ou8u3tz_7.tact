struct Level3 {
    val: Int?;
}

struct Level2 {
    level3: Level3;
}

struct Level1 {
    level2: Level2;
}

contract DeepOptionalNest {
    storage: Level1;

    init() {
        self.storage = Level1{ level2: Level2{ level3: Level3{ val: null } } };
    }
}