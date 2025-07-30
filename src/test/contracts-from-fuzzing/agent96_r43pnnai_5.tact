struct OptionalDeepNested {
    innerOpt: Level1?;
}

struct Level3 {
    x: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    mid: Level2;
}

contract DeepOptionalNestedTest {
    field: OptionalDeepNested;

    init() {
        self.field = OptionalDeepNested{
            innerOpt: null
        };
    }
}