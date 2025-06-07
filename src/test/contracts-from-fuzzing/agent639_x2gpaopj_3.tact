struct DeeplyNested {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    val: Int;
}

contract ManyLevels {
    n: DeeplyNested;
    init() {
        self.n = DeeplyNested{ level2: Level2{ level3: Level3{ val: 99 } } };
    }
}