struct OptionalDeep {
    level1: Level2?;
}

struct Level2 {
    level2field: Level3?;
}

struct Level3 {
    x: Int;
}

contract OptionalDeepContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            level1: null
        };
    }
}