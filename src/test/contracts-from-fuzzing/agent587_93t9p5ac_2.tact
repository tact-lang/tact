struct OptionalDeepNested {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
    x: Int;
}

struct Level2 {
    level3: Level3?;
    b: Bool;
}

struct Level3 {
    y: Int;
    z: Bool?;
}

contract OptionalDeepTest {
    state: OptionalDeepNested;

    init() {
        self.state = OptionalDeepNested{
            level1: null
        };
    }
}
