struct OptionalDeep {
    level2: Level2?;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    val: Int;
}

contract OptDeep {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{ level2: null };
    }
}