struct DeeplyNestedOpt {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    val: Int;
}

contract TestContract {
    state: DeeplyNestedOpt;

    init() {
        self.state = DeeplyNestedOpt{ level1: null };
    }
}