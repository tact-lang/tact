struct OptionalNest {
    level2: Level2?;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    value: Int?;
}

contract OptionalDeep {
    opt: OptionalNest?;
    init() {
        self.opt = null;
    }
}