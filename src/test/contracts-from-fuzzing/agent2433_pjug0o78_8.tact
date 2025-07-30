struct OptionalDeepNest {
    level1: OptionalLevel2?;
}

struct OptionalLevel2 {
    level2: OptionalLevel3?;
}

struct OptionalLevel3 {
    value: Int?;
}

contract OptionalDeepTest {
    store: OptionalDeepNest;

    init() {
        self.store = OptionalDeepNest{
            level1: null
        };
    }
}